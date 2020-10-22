# Blinky Sample

Change directories to `ncs/zephyr/samples/basic/blinky`. Then compile as shown before in the [compiling section](nrf9160-compiling-app.md) of this guide.

Before you do compile make sure that the following lines are added to the `prj.conf` if not already:

```
# Enable Zephyr application to be booted by MCUboot
CONFIG_BOOTLOADER_MCUBOOT=y
```

This will enable support for the bootloader. Then, build using the build command:

```
$ west build -b circuitdojo_feather_nrf9160ns
```

You can see towards the end of this output that both the application **and** the bootloader have been built and merged.

Programming can be completed with `newtmgr`:

```
$ newtmgr -c serial image upload build/zephyr/app_update.bin
```

**Note:** pre-built binary can be downloaded here: [blinky-v1.3.2.bin](files/blinky-v1.3.2.bin)