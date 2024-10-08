# Blinky Sample

Change directories to `ncs/zephyr/samples/basic/blinky`. Then compile as shown
before in the [example code section](nrf9160-example-code.md) of this guide.

Before you do compile make sure that the following lines are added to the
`prj.conf`:

```
# Enable Zephyr application to be booted by MCUboot
CONFIG_BOOTLOADER_MCUBOOT=y
```

This will enable support for the bootloader. Then, build using the build
command:

```
west build -b circuitdojo_feather_nrf9160_ns
```

**Note:** having trouble building? Make sure you check out the
[troubleshooting](nrf9160-troubleshooting.md) page.

You can see towards the end of this output that both the application **and** the
bootloader have been built and merged.

Programming can be completed with `newtmgr`:

```
newtmgr -c serial image upload build/zephyr/app_update.bin
newtmgr -c serial reset
```

**Note:** pre-built binary can be downloaded here:
[blinky-v1.3.2.bin](files/blinky-v1.3.2.bin)
