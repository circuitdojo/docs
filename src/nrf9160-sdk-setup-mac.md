# SDK Setup (Mac OS)

- [SDK Setup (Mac OS)](#sdk-setup-mac-os)
  - [Installing IDE](#installing-ide)
  - [Installing SDK](#installing-sdk)
  - [Installing `newtmgr` (Used to load your application via USB serial bootloader)](#installing-newtmgr-used-to-load-your-application-via-usb-serial-bootloader)
  - [Migrating from previous instructions](#migrating-from-previous-instructions)
  - [Testing it](#testing-it)

This page is all about getting your Mac compiling code for the nRF9160 Feather. Run into trouble during the process? Post your questions on the [community forum.](https://community.jaredwolff.com)

## Installing IDE
1. Install or use the code editor of your choice. I personally use Microsoft Visual Studio Code. The download link is [here](https://code.visualstudio.com/docs/?dv=osx)
1. If you decide to use Visual Studio Code, make sure you install the **C/C++** and **Cortex-Debug** extentions using the built in extension marketplace.

## Installing SDK

Before we start, if you already have NCS installed, you can skip to **Step 8**. Let's begin!

Installing the latest SDK is a snap and only takes a few steps. Let's walk through them here:

1. If you haven't already make sure you install Xcode Command Line tools. Without it you may run into issues compiling later on. Run the following in CLI:

   ```
   xcode-select --install
   ```

2. Download and install [nRF Connect For Desktop](https://www.nordicsemi.com/Software-and-tools/Development-Tools/nRF-Connect-for-desktop/Download#infotabs)
   
   ![Download page for nRF Connect For Desktop](img/sdk-setup-mac/nrf-connect-desktop-download.png)

3. Copy the app to your Applications folder

   ![Installer](img/sdk-setup-mac/copy-to-appliations.png)

4. Open up the app and install the Toolchain Manager

   ![Toolchain Manager install](img/sdk-setup-mac/toolchain-manager.png)

5. Then open it up.

   ![Open Toolchain Manager](img/sdk-setup-mac/open-toolchain-manager.png)

6. Scroll to the bottom and click **Install package from other source**

   ![Other source install](img/sdk-setup-mac/other-source-install.png)

7. Then paste this url into the box and click **ok**.

   ```
   http://developer.nordicsemi.com/.pc-tools/toolchain/ncs-toolchain-v1.5.0-20210225-607a0e0-minimal.dmg
   ```

   ![Insert into box](img/sdk-setup-mac/path-to-sdk-toolchain.png)

8. The download and install will take a few minutes. Hang out, take a walk, sing a song and come back later.
9.  Finally, once installed you'll have a dropdown that you can access. Click on it and then the **Open Terminal** option.
   ![Open terminal](img/sdk-setup-mac/open-terminal.png)

10. To get the nRF9160 Feather examples we'll update `/opt/nordic/ncs/v1.5.0/nrf/west.yml`. In the `projects` section add at the bottom:

    ```yaml
    - name: nfed
      url: https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers
      revision: v1.5.x
      path: nfed
    ```
    
    Here's the diff for the file afterwards:

    ```
    diff --git a/west.yml b/west.yml
      index db9211c27..4e8f92282 100644
      --- a/west.yml
      +++ b/west.yml
      @@ -145,6 +145,10 @@ manifest:
             remote: nordicsemi
             revision: 24f1b2b0c64c694b7f9ac1b7eab60b39236ca0bf
             path: modules/lib/cddl-gen
      +    - name: nfed
      +      url: https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers
      +      revision: v1.5.x
      +      path: nfed
       
         # West-related configuration for the nrf repository.
         self:
    ```

11. Then run `west update` in your freshly created terminal session. This will fetch the nRF9160 Feather examples.

## Installing `newtmgr` (Used to load your application via USB serial bootloader)

1. If you'r on a newer version of OSX you'll need to [install the drivers.](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)

2. For loading code to your nRF9160 Feather, you'll need to download and copy a custom version of `newtmgr`. Open a terminal window and run:

   ```
   cd ~/Downloads
   wget "https://docs.jaredwolff.com/files/newtmgr/darwin/newtmgr.zip"
   unzip newtmgr.zip
   mv newtmgr /opt/nordic/ncs/v1.5.0/toolchain/bin
   rm newtmgr.zip
   ```

3. Then you'll need to add your serial profile to make it easier to download/update your device:
   ```
   newtmgr conn add serial type=serial connstring='dev=/dev/tty.SLAB_USBtoUART,baud=1000000'
   ```
   If you have multiple Silicon Labs CP2102 connected to your machine your serial port *may be named differently*. I recommend you unplug all devices that could be named `tty.SLAB_USBtoUART` to ensure you're targeting the correct device during programming.

For more info in using `newtmgr` checkout the [programming section](nrf9160-programming-and-debugging.md#booloader-use) of this documentation.

## Migrating from previous instructions

Follow the same steps as above. Except for **Step 9**.  Then copy your `nfed` directory from your old setup to the new SDK folder. It will be in `/opt/nordic/ncs/v1.5.0/`. You'll want to checkout the latest using `git pull && git checkout v1.5.x`. 

## Testing it

Now you can get to playing around with some of the nRF9160 Feather example code! Remember you'll always have to open a terminal using the Toolchain Manager to build code!

You can quickly test if your SDK is set up correctly by checking out the [samples](nrf9160-example-code.md).