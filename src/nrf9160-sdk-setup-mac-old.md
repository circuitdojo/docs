# SDK Setup (Mac OS)

This page is all about getting your Mac compiling code for the nRF9160 Feather. Run into trouble during the process? Post your questions on the [community forum.](https://community.jaredwolff.com)

## Installing IDE
1. Install or use the code editor of your choice. I personally use Microsoft Visual Studio Code. The download link is [here](https://code.visualstudio.com/docs/?dv=osx)
1. If you decide to use Visual Studio Code, make sure you install the **C/C++** and **Cortex-Debug** extentions using the built in extension marketplace.

## Installing SDK
1. Install Python3. The easiest way is with [Homebrew](https://brew.sh). Install `brew` first, then open a terminal and run:
    ```
    brew install python3 git cmake ninja wget
    ```
1. Once complete, check to make sure that `python3` is installed. Here's the example output. (Your version may be different.)
   ```
   > python3 --version
   Python 3.8.6
   ```
    **💡Note:** if you've freshly installed Homebrew or get an error that `python3` is not found, you may have to add `/usr/local/bin` to your `PATH`. For example here's an entry for `.bash_profile` or `.zshrc`:
    ```
    export PATH=/usr/local/bin/:$PATH
    ```
    For a shell like `fish` you'll need:
    ```
    set -U fish_user_paths /usr/local/bin/ $fish_user_paths
    ```
1. Also check that `git` is installed with:
   ```
   ❯ git --version
   git version 2.27.0
   ```
1. Install `west`. West is the most important utility for using nRF Connect SDK & Zephyr. You'll become *quite* familliar with very soon.
   ```
   pip3 install west
   ```
   **💡Note:** you can update `west` by issuing `pip3 install -U west` It will uninstall the version on your machine and replace it with the latest. (It won't do anything if you have the latest installed.)
1. Now create a folder on your machine and call it `nfed` (short for nRF9160 Feather Examples and Drivers). Open a terminal to this folder and initialize nRF Connect SDK using `west`:
   ```
   cd ~
   mkdir nfed
   cd nfed
   west init -m https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers --mr main
   ```

2. Once your nRF Connect SDK compontents are downloaded, you'll need to fetch the remaining SDK:
   ```
   west update
   ```
   You'll see a *bunch* of output go by as `west` downloads dependencies using Git.

   Here's what your `nfed` folder should look like:
   ```
   ❯ tree -L 1
   .
   ├── bootloader
   ├── build
   ├── latest
   ├── mbedtls
   ├── modules
   ├── nrf
   ├── nrf9160-feather
   ├── nrfxlib
   ├── test
   ├── tools
   └── zephyr
   ```
3. Install the remaining `python3` requirements by running these commands in your `nfed` directory.
   ```
   pip3 install -r zephyr/scripts/requirements.txt
   pip3 install -r nrf/scripts/requirements.txt
   pip3 install -r bootloader/mcuboot/scripts/requirements.txt
   ```

## The ARM Embedded Toolchain


1. Install the toolchain by pulling it from ARM. Run these commands:

   ```
   cd ~
   wget "https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-mac.tar.bz2"
   tar xvfj gcc-arm-none-eabi-9-2019-q4-major-mac.tar.bz2
   rm gcc-arm-none-eabi-9-2019-q4-major-mac.tar.bz2
   ```

   **Note** for Catalina users you will get an error when running these utilities for the first time. You must allow them to be executed in your Security preferences.

   ![Error running ARM Toolchain](img/sdk-setup-mac/cannot-be-opened.jpeg)

1. Finally you'll need export a few important environment variables for things to work. For `bash` here's the entry for `.bash_profile` that I have:
   ```
   # Zephyr related
   export ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb
   export GNUARMEMB_TOOLCHAIN_PATH="~/gcc-arm-none-eabi-9-2019-q4-major"
   ```

   **💡Note:** this should also work for `.zshrc` for those folks who are using newer versions of Mac OS (or just plain prefer `zsh`)

   For folks using `fish` you're going to use:

   ```
   set -Ux ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb
   set -Ux GNUARMEMB_TOOLCHAIN_PATH "~/gcc-arm-none-eabi-9-2019-q4-major"
   ```

## `newtmgr`

1. For loading code to your nRF9160 Feather, you'll need to download and copy a custom version of `newtmgr` to a folder in your `PATH`.

   ```
   cd ~/Downloads
   wget "https://docs.jaredwolff.com/files/newtmgr/darwin/newtmgr.zip"
   unzip newtmgr.zip
   sudo mv newtmgr /usr/local/bin
   rm newtmgr.zip
   ```

    If you're not sure, `/usr/local/bin/` is always a good spot for these types of binaries.
1. Then you'll need to add your serial profile to make it easier to download/update your device:
   ```
   newtmgr conn add serial type=serial connstring='dev=/dev/tty.SLAB_USBtoUART,baud=1000000'
   ```
   If you have multiple Silicon Labs CP2102 connected to your machine your serial port *may be named differently*. I recommend you unplug all devices that could be named `tty.SLAB_USBtoUART` to ensure you're targeting the correct device during programming.
2. **Having trouble?** You may have to [install the drivers.](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)

For more info in using `newtmgr` checkout the [programming section](nrf9160-programming-and-debugging.md#booloader-use) of this documentation.

## Testing it

You can quickly test if your SDK is set up correctly by checking out the [`blinky` example](nrf9160-blinky-sample.md).