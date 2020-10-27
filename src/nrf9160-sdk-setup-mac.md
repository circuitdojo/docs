# SDK Setup (Mac OS)

This page is all about getting your Mac compiling code for the nRF9160 Feather. Run into trouble during the process? Post your questions on the [community forum.](https://community.jaredwolff.com)

## Installing IDE
1. Install or use the code editor of your choice. I personally use Microsoft Visual Studio Code. The download link is [here](https://code.visualstudio.com/docs/?dv=osx)
1. If you decide to use Visual Studio Code, make sure you install the **C/C++** and **Cortex-Debug** extentions using the built in extension marketplace.

## Installing SDK
1. Install Python3. The easiest way is with [Homebrew](https://brew.sh). Install `brew` first, then open a terminal and run:
    ```
    brew install python3 git gcc-arm-embedded
    ```
1. Once complete, check to make sure that `python3` is installed:
   ```
   python3 --version
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
1. Now create a folder on your machine and call it `ncs` (short for nRF Connect SDK). Open a terminal to this folder and initialize nRF Connect SDK using `west`:
   ```
   cd ~
   mkdir ncs
   cd ncs
   west init -m https://github.com/nrfconnect/sdk-nrf --mr v1.3.2
   ```
   This will install the latest stable version of the SDK. Once downloaded you can always change versions of the SDK by:
     1. Changing to the `nrf` directory
     1. Fetching any new changes using `git fetch origin`
     1. Checking out the tag you'd like (ex. `git checkout v1.2.2`)
     1. Running a `west update`

    **💡Note:** if you make changes to the dependency directories, you may see a warning in yellow stating `west` could not update. You'll need to clean that dependency or stash it using `git reset --hard` or `git stash`. Stashing is preferred that way if you want to save your work.
1. Once your nRF Connect SDK compontents are downloaded, you'll need to fetch the remaining SDK:
   ```
   west update
   ```
   You'll see a *bunch* of output go by as `west` downloads dependencies using Git.

   Here's what your `ncs` folder should look like:
   ```
   ❯ tree -L 1
   .
   ├── bootloader
   ├── build
   ├── latest
   ├── mbedtls
   ├── modules
   ├── nrf
   ├── nrfxlib
   ├── test
   ├── tools
   └── zephyr
   ```
1. Installing the remaining SDK requirements using `pip3`:
   ```
   pip3 install -r zephyr/scripts/requirements.txt
   pip3 install -r nrf/scripts/requirements.txt
   pip3 install -r bootloader/mcuboot/scripts/requirements.txt
   ```
1. If you're using `v1.3.2` of nRF Connect SDK, you'll need to download and "install" the nRF9160 Feather board definitions. (Normally you would not have to do this but older versions of NCS do not have them included).
    [You can download them here.](nrf9160-downloads.md)
1. Once downloaded, extract the folder to `ncs/zephyr/boards/arm/` so that `circuitdojo_feather_nrf9160ns` is in the `arm` folder. (The full path to the above should be `ncs/zephyr/boards/arm/circuitdojo_feather_nrf9160ns/`) That's all you need to do!

    **💡Note:** if you ever upgrade to a more recent version of NCS you'll need to remove or rename this folder since newer versions *will* have this folder.

## The ARM Embedded Toolchain

1. First let's make sure it installed correctly in the `brew install` setup earlier. In a terminal run `arm-none-eabi-gcc --version` to confirm it's in the right place:
   ```
   ❯ arm-none-eabi-gcc --version
   arm-none-eabi-gcc (GNU Arm Embedded Toolchain 9-2020-q2-update) 9.3.1 20200408 (release)
   Copyright (C) 2019 Free Software Foundation, Inc.
   This is free software; see the source for copying conditions.  There is NO
   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
   ```

1. Finally you'll need export a few important environment variables for things to work. For `bash` here's the entry for `.bash_profile` that I have:
   ```
   # Zephyr related
   export ZEPHYR_TOOLCHAIN_VARIANT=cross-compile
   export CROSS_COMPILE=/usr/local/bin/arm-none-eabi-
   ```

   **💡Note:** this should also work for `.zshrc` for those folks who are using newer versions of Mac OS (or just plain prefer `zsh`)

   For folks using `fish` you're going to use:

   ```
   set -Ux ZEPHYR_TOOLCHAIN_VARIANT cross-compile
   set -Ux CROSS_COMPILE /usr/local/bin/arm-none-eabi-
   ```

## `newtmgr`

1. For loading code to your nRF9160 Feather, you'll need to download and copy a custom version of `newtmgr` to a folder in your `PATH`.
   - [Mac OSX](files/newtmgr/darwin/newtmgr)

    If you're not sure, `/usr/local/bin/` is always a good spot for these types of binaries.
1. Then you'll need to add your serial profile to make it easier to download/update your device:
   ```
   newtmgr conn add serial type=serial connstring='dev=/dev/tty.SLAB_USBtoUART,baud=1000000'
   ```
   If you have multiple Silicon Labs CP2102 connected to your machine your serial port *may be named differently*. I recommend you unplug all devices that could be named `tty.SLAB_USBtoUART` to ensure you're targeting the correct device during programming.

For more info in using `newtmgr` checkout the [programming section](nrf9160-programming-and-debugging.md#booloader-use) of this documentation.

## Testing it

You can quickly test if your SDK is set up correctly by checking out the [`blinky` example](nrf9160-blinky-sample.md).