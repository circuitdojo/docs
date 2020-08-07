# Programming and Debugging

There are currently two ways of programming the nRF9160 Feather. You can use the built-in bootloader or use an external programmer.

- [Bootloader use](#booloader-use)
- [External programming](#requirements-for-external-programming)

## Booloader use

Currently the nRF9160 Feather uses the MCUBoot bootloader which comes standard with the nRF Connect SDK. In order to utilize the bootloader, you'll ned to install `mcumgr`. Here's how below:

### On Windows

1. Make sure you have the latest version of Go installed. You can [install according to the information here.](https://golang.org/dl/)
1. Run `go get github.com/apache/mynewt-mcumgr-cli/mcumgr` from `cmd`.
1. Make sure that `C:\Go\bin\` is in your `PATH`. (Should be done by default)
1. Once done, run `mcumgr` to make sure it's installed!

![Go on Windows](img/mcumgr.png)

### On OSX

To install you'll need Go version 1.7 or greater. You can either use `brew` ([HomeBrew](https://brew.sh)) or download the [installer from here.](https://golang.org/dl/)

1. If you don't have Hombrew installed run: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
1. If you don't have Go installed,run `brew install go`.
1. Run `go get github.com/apache/mynewt-mcumgr-cli/mcumgr` from any terminal.
1. Make sure that `~/go/bin/` is in your `PATH`. (Should be done by default)
1. Once done, run `mcumgr` to make sure it's installed!

![mcumgr on OSX](img/mcumgr-osx.png)

## Using `mcumgr`

**Pre-check:** MCUBoot *needs* to be enabled in your project before you can use it! Make sure that you have `CONFIG_BOOTLOADER_MCUBOOT=y` in your `prj.conf`

1. Put your nRF9160 Feather into DFU mode.
   1. Hold the MODE button
   1. Then tap the RST button while holding mode
   1. Let go of the MODE button
1. Building your application if you haven't already with `west build`. It will create a folder called `build`. The file we care about is `build/zephyr/app_update.bin`
1. Load the file using `mcumgr`
    ```
    mcumgr --conntype=serial --connstring /dev/tty.SLAB_USBtoUART image upload build/zephyr/app_update.bin
    mcumgr --conntype=serial --connstring /dev/tty.SLAB_USBtoUART reset
    ```
    Your firmware will then be transferred.

**Two important notes:**

1. The transfer process is currently *slow*. The default BAUD is 115200. I've tested it at higher speeds (1M BAUD) and it works well. Stay tuned for improvements here. If you want guarenteed fast programming speeds, use the J-Link method.
1. The nRF9160 Feather does not respond to `mcumgr` commands **unless it's in DFU mode**.

## Requirements for external programming

You can also use external programmers with the nRF9160 Feather. Here are the current supported external programmers:

1. [nRF5340-PDK](https://www.nordicsemi.com/Software-and-tools/Development-Kits/nRF5340-PDK)
1. [nRF9160-DK](https://www.nordicsemi.com/Software-and-tools/Development-Kits/nRF9160-DK)

**Note:** Most commercial J-Link programmers \*should\* work with the nRF9160 Feather. In particular the [J-Link EDU Mini](https://www.segger.com/products/debug-probes/j-link/models/j-link-edu-mini/) is a great choice if you're building non-commercial products. (Supports Cortex M33 processors. Untested at this time.)

**🚨Important:** the nRF52 and nRF51 based development kits **do not work** with the nRF9160 Feather!

👉Additionally, you'll also need a Tag-Connect cable. The nRF9160 Feather was designed to use the TC2030-CTX-NL. For more information check out [Tag-Connect's product page.](https://www.tag-connect.com/product/tc2030-ctx-nl-6-pin-no-legs-cable-with-10-pin-micro-connector-for-cortex-processors)

## Installing programmer software

In this next section, I'll be focusing on using the nRF5340-PDK as *the* programmer of choice. These steps should not be different from other J-Link supported boards.

1. Download your version of the [nRF Command Line Tools](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Command-Line-Tools/Download#infotabs)

### Windows

2. Then, run the `.exe` that was downloaded. It will do all the heavy lifting for you.
3. Run `nrfjprog` in a `cmd` window to make sure your install is working.

### Mac

2. First run `nRF-Command-Line-Tools_10_9_0_OSX.pkg`
3. Once that install is done, run `JLink_MacOSX_V680a.pkg`
4. Open a fresh terminal window and run `nrfjprog` to make sure your install is complete.

## Setting up the nRF5340-PDK

Here are a couple of close up shots of how to connect the nRF5340-PDK:

![nrf53-dk-connected](img/nrf53-dk-connected.jpg)

![nRF9160 Feather w/ USB](img/nrf9160-feather.jpg)

![nRF9160 Feather w/ Tag Connect](img/nrf9160-feather-tag-connect.jpg)

![nRF9160 Feather w/ Tag Connect Connected](img/nrf9160-feather-tag-connect-connected.jpg)

I highly recommend you jump *SB47* on your nRF5380-PDK with some solder. This forces the debugger to think an external devices is permanently connected. If you're only doing external debugging, this is very useful.

![nRF5340-DK jumper highlighted](img/nrf53-dk-jumper.jpeg)

After hooking things up, It's time to do a quick smoke test. Running `nrfjprog -r` in a terminal should show this result:

```jsx
$ nrfjprog -r
Applying system reset.
Run.
```

Success!

**Note:** these pictures are with an early version of the nRF9160 Feather. The procedure is the same. The orientation of the Tag-Connect though is horizontal not vertical as seen in the pictures.

## Programming with the nRF5340-PDK

Programming with the nRF5340-PDK is straight forward in Zephyr using `west`. Here's what it looks like:

```bash
west build -b circuitdojo_feather_nrf9160ns -p
west flash --runner nrfjprog
nrfjprog -r
```

In the above, i'm:

1. Doing a pristine build of my application with the nRF9160 Feather as the target.
1. Then flashing using the `nrfjprog` runner option. This is preferred for all J-Link boards.
1. Resetting the board using `nrfjprog -r`. As of this writing, `west` does not reset the board after programming.
