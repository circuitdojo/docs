# SDK Setup (Windows)

- [SDK Setup (Windows)](#sdk-setup-windows)
  - [Installing Extension](#installing-extension)
    - [Run Setup](#run-setup)
    - [Init the repo](#init-the-repo)
    - [Then build the sample!](#then-build-the-sample)
  - [`newtmgr` (Used to load your application via USB serial bootloader)](#newtmgr-used-to-load-your-application-via-usb-serial-bootloader)
    - [Debugging `newtmgr`](#debugging-newtmgr)
  - [Testing it](#testing-it)

This page is all about getting your Windows machine compiling code for the nRF9160 Feather. Run into trouble during the process? Post your questions on the [community forum.](https://community.circuitdojo.com)

## Installing Extension

If you didn't already, install Visual Studio code. You can [download it here](https://code.visualstudio.com/docs/?dv=win64user)

![Marketplace](air-quality-wing/img/extension/marketplace.png)

Once Visual Studio code is installed, [download the extension here. 👈](https://marketplace.visualstudio.com/items?itemName=circuitdojo.zephyr-tools&ssr=false#overview)

Once loaded it will also install all necessary VSCode dependencies.

Then, install `git` and `python` if you don't have them already:

- Download and install `git` [from here.](https://git-scm.com/download/win)
- Download and install `python` [from here.](https://www.python.org/ftp/python/3.9.9/python-3.9.9-amd64.exe)

### Run Setup

Then open the command window (COMMAND+SHIFT+P on Mac or CTRL+SHIFT+P on other systems) and type `Zephyr Tools: Setup`

![Setup](air-quality-wing/img/extension/setup.png)

**Note:** you may get an error that states "certificate has expired”. This is due to the certificates in VSCode being out of date. The easiest way to fix this is by updating your settings by setting `http.systemCertificates` to `false`.

```
http.systemCertificates: false
```

If you search for "system certificates" in your VSCode settings it should come right up.

### Init the repo

Then initialize this repo using the `Zephyr Tools: Init Repo` command:

![Init repo](air-quality-wing/img/extension/init-repo.png)

Make sure you use `https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers.git` as the URL. It's best to select an **empty folder** to initialize the project to.

If prompted for a branch, press 'Enter' to use the default.

![Default branch](air-quality-wing/img/extension/windows-default-branch.png)

### Then build the sample!

![Build](air-quality-wing/img/extension/build.png)

You'll be prompted for a **project** and **board**. Make sure the board matches the supported boards. Current supported board targets include:

Here's what it will look like:

![Choosing board](air-quality-wing/img/extension/choosing-board.png)
![Choosing app](air-quality-wing/img/extension/choosing-app.png)

Once the build completes you should get a **Build complete!** popup along with some success messages in the the terminal.

## `newtmgr` (Used to load your application via USB serial bootloader)

`newtmgr` is the command line utility for loading code to your device. It is automatically installed with the VSCode extension. Lets configure it the rest of the way.

1. Configuring is simple as running the **Zephyr Tools: Setup Newtmgr** command

   ![Setup newtmgr](air-quality-wing/img/extension/setup-newtmgr.png)

   Select your serial port:

   ![Select serial port](air-quality-wing/img/extension/select-serialport.png)

   Then select the BAUD. (**Important!** The nRF19160 Feather _only_ supports `1000000`) Once complete you're ready to run the **Zephyr Tools: Load via Bootloader** command.

   ![Select baud](air-quality-wing/img/extension/select-baud.png)

### Debugging `newtmgr`

**Having trouble?** You may need to install the [Silabs VCP driver.](https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers). Download and install the **CP210x VCP Windows** option.

For more info in using `newtmgr` checkout the [programming section](nrf9160-programming-and-debugging.md#booloader-use) of this documentation.

## Testing it

You can quickly test if your SDK is set up correctly by checking out the [samples](nrf9160-example-code.md). Make sure that you've closed and re-opened all terminals and Visual Studio Code so the environment is correct. Otherwise you may have issues compiling or flashing code.
