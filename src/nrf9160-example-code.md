# Example Code

![Examples](img/examples.png)

- [Example Code](#example-code)
  - [Examples](#examples)
  - [Building and loading using VSCode](#building-and-loading-using-vscode)
  - [Building Manually](#building-manually)

## Examples

All examples can be found in the
[nRF9160 Feather Examples and Drivers (nFED) repository](https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers).
You can install it during the setup process. Here are some links to setting up
on different platforms:

- [Windows](nrf9160-sdk-setup-windows.md#installing-sdk)
- [Mac](nrf9160-sdk-setup-mac.md#installing-sdk)
- [Linux](nrf9160-sdk-setup-linux.md#installing-sdk)

All samples are in `nfed/samples` (or `nfed/samples` depending on how you set
everything up). They include:

- accelerometer - for a basic onboard accelerometer demo
- at_client - for testing connections using LTE Link Monitor (📶 requires SIM if
  you want to connect to LTE/NB IoT)
- battery - for a basic onboard battery measurement demo
- blinky - for a basic led blink demo
- bme280 - for an example of using the bme280 on i2c
- button - for a basic example using the onboard **mode** button
- deep_sleep - ultra deep sleep mode demo
- external_flash - external flash demo
- external_rtc - using onboard RTC demo
- gps - basic gps demo (📶 requires SIM if you want to connect to LTE/NB IoT to
  retreive SUPL data)
- sms - basic SMS demo (📶 requires SIM to send SMS)

Most of these examples are based from the nRF Connect SDK (either directly from
Nordic or Zephyr)

More examples coming soon!

## Building and loading using VSCode

Using the command window run **Zephyr Tools: Build**

![Build](air-quality-wing/img/extension/build.png)

Then place the device into bootloader mode:

1. Hold the MODE button
2. Then tap the RST button while holding mode
3. **Hold the MODE button until the Blue LED illuminates**

Then, load using the **Zephyr Tools: Load via Bootloader** task.

![Option for loading](air-quality-wing/img/extension/load-via-newtmgr.png)

Pay attention to the progress in the bottom console.

![Option for loading](air-quality-wing/img/extension/load-via-newtmgr-progress.png)

Once complete, the extension will reset your device and should start executing!

**Important:** make sure you close all console sessions with your nRF9160
Feather before programming using `newtmgr`. Otherwise the `newtmgr` image upload
will timeout.

## Building Manually

To build an example,

1. Install and setup the VSCode Extension for your OS:
   1. [Windows](nrf9160-sdk-setup-windows.md#installing-sdk)
   2. [Mac](nrf9160-sdk-setup-mac.md#installing-sdk)
   3. [Linux](nrf9160-sdk-setup-linux.md#installing-sdk)
2. With the extension installed and setup, navigate to the sample you want in a
   **VSCode terminal** and run:

```
west build -b circuitdojo_feather_nrf9160_ns
```

Here's an example of output when finished:

```
west build -b circuitdojo_feather_nrf9160_ns

...

-- Configuring done
-- Generating done
-- Build files have been written to: /Users/jaredwolff/Git/nrf-connect/ncs/nrf/samples/nrf9160/at_client/build
[0/180] Performing build step for 'spm_subimage'
[151/155] Linking C executable zephyr/zephyr_prebuilt.elf
Memory region         Used Size  Region Size  %age Used
           FLASH:       32256 B        48 KB     65.62%
            SRAM:        5488 B        64 KB      8.37%
        IDT_LIST:          40 B         2 KB      1.95%
[155/155] Linking C executable zephyr/zephyr.elf
[2/176] Performing build step for 'mcuboot_subimage'
[248/253] Linking C executable zephyr/zephyr_prebuilt.elf
Memory region         Used Size  Region Size  %age Used
           FLASH:       42500 B        48 KB     86.47%
            SRAM:       26800 B        64 KB     40.89%
        IDT_LIST:          72 B         2 KB      3.52%
[253/253] Linking C executable zephyr/zephyr.elf
[163/176] Linking C executable zephyr/zephyr_prebuilt.elf
Memory region         Used Size  Region Size  %age Used
           FLASH:       76868 B     441856 B     17.40%
            SRAM:       36928 B       128 KB     28.17%
        IDT_LIST:         120 B         2 KB      5.86%
[174/174] Generating zephyr/merged.hex
```

**Note:** having trouble building? Make sure you check out the
[troubleshooting](nrf9160-troubleshooting.md) page.

Programming can be completed with `newtmgr`:

```
newtmgr -c serial image upload build/zephyr/app_update.bin
```

**Note** you always want to use the `app_update.bin` when using `newtmgr`. These
binaries are also used for FOTA and are always located in
`your_sample/build/zephyr/`.

During testing, it's recomended to use the
[LTE Link Monitor](nrf9160-nrf-connect-desktop.md#using-with-lte-link-monitor)
whenever you need to manually test or execute commands.
