# Debug Serial Usage

- [Debug Serial Usage](#debug-serial-usage)
  - [Multi-Platform](#multi-platform)
    - [nRF Connect For Desktop - LTE Link Monitor](#nrf-connect-for-desktop---lte-link-monitor)
    - [CoolTerm](#coolterm)
  - [Mac OSX & Linux](#mac-osx--linux)
    - [`screen`](#screen)
    - [`cu`](#cu)

The nRF9160 Feather comes with an on-board Silicon Labs CP2102 USB-to-UART chip. You can use it with most serial terminal viewers. If you have an older version of Windows you will have to install the driver. [The download is located here.](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)

Here's some recommendations for software to communicate with the nRF9160 Feather. No matter what program you use, the standard baud rate for the console is 115200. All other options are standard/default (8 bits, oon-pairty, 1 stop bit).

## Multi-Platform

### nRF Connect For Desktop - LTE Link Monitor

If you haven't already, make sure you check out the [LTE Link Monitor](nrf9160-nrf-connect-desktop.md#lte-link-monitor). It's a great multi-purpose tool for using and debugging the nRF9160 Feather.

### CoolTerm

![CoolTerm](img/coolterm.png)

CoolTerm has been my go-to for testing and debugging. Fortunately it's also multi-platform! You can download it by going here: https://www.freeware.the-meiers.org

## Mac OSX & Linux

### `screen`

You can use `screen` to view your debug output. Here's a typical command:

```
screen /dev/tty.SLAB_USBtoUART 115200
```

The major drawback of using `screen` is that it does not save your history. It's better to use other utilities for that purpose.

**Note:** depending on your system your serial port may be named something different from `/dev/tty.SLAB_USBtoUART`. You can check your dev folder like this to check which one may be it:

```
ls -l /dev | grep SLAB
```


### `cu`

You can also use `cu` to display your debug output. Here's an example:

```
sudo cu -l /dev/tty.SLAB_USBtoUART -s 115200
```

If you notice, it requires super user permissions. (This is the only drawback to it IMHO)

To escape from your session type `~.`