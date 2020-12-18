# AT Client Sample

## Precompiled Binary

**Note:** you can get a pre-build binary file compiled using v1.3.2 [here](files/at-client-v1.3.2.bin).

## Instructions

Change directories to `ncs/nrf/samples/nrf9160/at_client`. Then compile as shown beffore in the [compiling section](nrf9160-compiling-app.md) of this guide.

Before you do compile make sure that the following lines are added to the `prj.conf`:

```
# Enable Zephyr application to be booted by MCUboot
CONFIG_BOOTLOADER_MCUBOOT=y
```

This will enable support for the bootloader. Then, build using the build command:

```
west build -b circuitdojo_feather_nrf9160ns

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

**Note:** having trouble building? Make sure you check out the [troubleshooting](nrf9160-troubleshooting.md) page.

You can see towards the end of this output that both the application **and** the bootloader have been built and merged.

Programming can be completed with `newtmgr`:

```
newtmgr -c serial image upload build/zephyr/app_update.bin
```

During testing, it's recomended to use the [LTE Link Monitor](nrf9160-nrf-connect-desktop.md#using-with-lte-link-monitor) whenever you need to manually test or execute commands.

