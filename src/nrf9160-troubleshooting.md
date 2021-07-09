# Troubleshooting

This page has a list of common problems and solutions realated to the nRF9160 Feather.

## Compiling Problems

### Getting a `west.manifest.ManifestImportFailed` when building on Mac

Make sure that you've installed Xcode Command Line tools using `xcode-select --install`

## Programming problems

### The nRF9160 Feather does nothing after being programmed/flashed.

After being programmed using `west flash`, you may have to issue an additional `nrfjprog -r` or hit the `RST` button on the board. This should start code execution.

## GPS Connection issues

### Unable to get a fix after waiting a long time. (Using the [`gps` example.](nrf9160-example-code.md)

If your nRF9160 Feather is plugged into USB, try a different USB power supply. During the testing of the nRF9160 Feather, I found that certain USB C-to-A adapters injected were not properly grounded. This lead to issues getting a fix or prevented it all together. This especially applied to Apple Macbooks.

### "The toolchain is unable to build a dummy C file"

If you're trying to build an example and you're getting an error building your code your should delete the `Cmake` cache:

```bash
rm -rf ~/Library/Caches/zephyr
```

More info here: [https://devzone.nordicsemi.com/f/nordic-q-a/55475/the-toolchain-is-unable-to-build-a-dummy-c-file](https://devzone.nordicsemi.com/f/nordic-q-a/55475/the-toolchain-is-unable-to-build-a-dummy-c-file)

Also a post on the forum: [https://community.jaredwolff.com/d/51-error-whilst-compiling-blinky/3](https://community.jaredwolff.com/d/51-error-whilst-compiling-blinky/3)


### Debugging a Hard Fault

```
[00:00:07.098,754] <err> os: Exception occurred in Secure State
[00:00:07.105,346] <err> os: ***** HARD FAULT *****
[00:00:07.110,961] <err> os:   Fault escalation (see below)
[00:00:07.117,279] <err> os: ***** BUS FAULT *****
[00:00:07.122,833] <err> os:   Precise data bus error
[00:00:07.128,601] <err> os:   BFAR Address: 0x50008158
[00:00:07.134,582] <err> os: r0/a1:  0x00000000  r1/a2:  0x20021489  r2/a3:  0x20021490
[00:00:07.143,341] <err> os: r3/a4:  0xffffffff r12/ip:  0x00046f95 r14/lr:  0x0003ba81
[00:00:07.152,130] <err> os:  xpsr:  0x81000000
[00:00:07.157,379] <err> os: s[ 0]:  0x00000000  s[ 1]:  0x00000000  s[ 2]:  0x00000000  s[ 3]:  0x00000000
[00:00:07.167,938] <err> os: s[ 4]:  0x00000000  s[ 5]:  0x00000000  s[ 6]:  0x00000000  s[ 7]:  0x00000000
[00:00:07.178,466] <err> os: s[ 8]:  0x00000000  s[ 9]:  0x00000000  s[10]:  0x00000000  s[11]:  0x00000000
[00:00:07.188,995] <err> os: s[12]:  0x00000000  s[13]:  0x00000000  s[14]:  0x00000000  s[15]:  0x00000000
[00:00:07.199,523] <err> os: fpscr:  0x00000000
[00:00:07.204,772] <err> os: Faulting instruction address (r15/pc): 0x00047ba0
[00:00:07.212,768] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
[00:00:07.220,672] <err> os: Current thread: 0x20017d00 (unknown)
```

```
$ /opt/nordic/ncs/v1.5.0/toolchain/bin/arm-none-eabi-addr2line -e build/zephyr/zephyr.elf 0x00047ba0
reent.c:?
```


### `Error 3` from `newtmgr`

While programming via `newtmgr` you may run into problems programming your board via the bootloader:

```
newtmgr -c serial image upload build/zephyr/app_update.bin
63.70 KiB / 65.69 KiB [===================================================================================================================================================================================>-----]  96.98% 15.82 KiB/s
Error: 3
```

There are a few reasons for this incuding:

* Make sure that you do not have your serial console open while transferring. This will case some data to drop during the application upgrade.
* V1 versions of the nRF9160 Feather only work with older versions of the SDK (1.2.x ad 1.3.x). The solution here is to upgrade the bootloader.
    * Navigate to the [downloads](nrf9160-downloads.md) page and download the V2 bootloader
    * Attach your programming cable and board as you would in [programming and debugging](nrf9160-programming-and-debugging.md)
    * Use `nrfjprog` (or similar) to load the file:
    
    ```
    nrfjprog --program bootloader.hex --chiperase
    ```
  Alternatively you can also downgrade SDK version but this is not supported.
* For V1 bootloaders, `newtmgr` will not program images above 196kB. The solution here is to upgrade to the latest bootloader.