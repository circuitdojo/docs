# Low Power Operation

In most examples when your device goes idle, it will go into a sleep mode
automatically. In the best case,

1. v6 boards draw:

   - ~10 uA via 3.6V Vbat at room temp

2. v4 boards draw:

   - ~30µA via 3.6V Vbat at room temp.

Optimizing for low power does take some extra work to make sure all sources of
current draw are turned off. The
[active sleep sample in NFED](https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers/tree/v1.9.x/samples/active_sleep)
does this for you.

If you'd like to optimize manually, here are some important steps to getting low
power.

1. Remove all connections to SWD programmer
2. Set your prj.conf to match these values

   ```
   # Stacks and heaps
   CONFIG_MAIN_STACK_SIZE=4096
   CONFIG_HEAP_MEM_POOL_SIZE=16384

   CONFIG_GPIO=y
   CONFIG_I2C=y
   CONFIG_SPI=y
   CONFIG_DEBUG=n

   # Add the accelerometer
   CONFIG_SENSOR=y
   CONFIG_LIS2DH=y

   CONFIG_CONSOLE=n
   CONFIG_UART_CONSOLE=n
   CONFIG_SERIAL=n

   # Zephyr Device Power Management
   CONFIG_DEVICE_POWER_MANAGEMENT=y
   CONFIG_PM=y

   # Network
   CONFIG_NETWORKING=y
   CONFIG_NET_SOCKETS=y
   CONFIG_NET_NATIVE=n
   CONFIG_NET_SOCKETS_POSIX_NAMES=y

   # Modem
   CONFIG_NRF_MODEM_LIB=y

   # Enable Zephyr application to be booted by MCUboot
   CONFIG_BOOTLOADER_MCUBOOT=y
   ```

   Importantly the accelerometer needs to be enabled and `CONFIG_SERIAL` _MUST_
   be set to =n. This turns off all console/debug output to the USB to UART
   chip.

3. In an `boards/circuitdojo_feather_nrf9160_ns.overlay` define the following:

   ```
   &i2c1 {
     lis2dh@18 {
         compatible = "st,lis2dh";
         label = "LIS2DH";
         reg = <0x18>;
         irq-gpios = <&gpio0 29 GPIO_ACTIVE_HIGH>, <&gpio0 30 GPIO_ACTIVE_HIGH>;
         disconnect-sdo-sa0-pull-up;
     };
   };
   ```

   `disconnect-sdo-sa0-pull-up` saves about 130µA during sleep as it disables a
   Pull-Up within the LIS2DH12TR that is connected to the grounded SDO pin.

If you only have one thread running you can put the device into idle this way:

```
while (1)
{
k_cpu_idle();
}
```

Examples like the Asset Tracker will manage this state for you.
