# SDK Setup (Mac OS)

- [SDK Setup (Mac OS)](#sdk-setup-mac-os)
  - [Installing Extension](#installing-extension)
    - [Run Setup](#run-setup)
    - [Init the repo](#init-the-repo)
    - [Then build the sample!](#then-build-the-sample)
  - [`newtmgr` (Used to load your application via USB serial bootloader)](#newtmgr-used-to-load-your-application-via-usb-serial-bootloader)
  - [Testing it](#testing-it)

This page is all about getting your Mac compiling code for the nRF9160 Feather. Run into trouble during the process? Post your questions on the [community forum.](https://community.circuitdojo.com)

## Installing Extension

If you didn't already, install Visual Studio code. You can [download it here.](https://code.visualstudio.com/docs/?dv=osx)

![Marketplace](air-quality-wing/img/extension/marketplace.png)

Fortunately, it's a bit easier to get started with the VSCode extension. The VSCode is required along with a Python 3 and Git on your system before continuing. Arm64 Macs will require the additional install of `ninja`.

Once Visual Studio code is installed, [download the extension here. 👈](https://marketplace.visualstudio.com/items?itemName=circuitdojo.zephyr-tools&ssr=false#overview)

The easiest way to install `git`, `python3` and `ninja` (only required for Arm64 Macs) is with [Homebrew](https://brew.sh).

```
> brew install git python3 ninja
```

### Run Setup

Then open the command window (COMMAND+SHIFT+P on Mac or CTRL+SHIFT+P on other systems) and type `Zephyr Tools: Setup`

![Setup](air-quality-wing/img/extension/setup.png)

### Init the repo

Then initialize this repo using the `Zephyr Tools: Init Repo` command:

![Init repo](air-quality-wing/img/extension/init-repo.png)

Make sure you use `https://github.com/circuitdojo/nrf9160-feather-examples-and-drivers.git` as the URL. It's best to select an **empty folder** to initialize the project to.

### Then build the sample!

![Build](air-quality-wing/img/extension/build.png)

You'll be prompted for a **project** and **board**. Make sure the board matches the supported boards. Current supported board targets include:

Here's what it will look like:

![Choosing board](air-quality-wing/img/extension/choosing-board.png)
![Choosing app](air-quality-wing/img/extension/choosing-app.png)

Once the build completes you should get a **Build complete!** popup along with some success messages in the the terminal.

## `newtmgr` (Used to load your application via USB serial bootloader)

`newtmgr` is the command line utility for loading code to your device. It is automatically installed with the VSCode extension. Lets configure it the rest of the way.

1. If you'r on a newer version of OSX you'll need to [install the drivers.](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers)

2. Configuring is simple as running the **Zephyr Tools: Setup Newtmgr** command

   ![Setup newtmgr](air-quality-wing/img/extension/setup-newtmgr.png)

   Select your serial port:

   ![Select serial port](air-quality-wing/img/extension/select-serialport.png)

   Then select the BAUD. (**Important!** The nRF19160 Feather _only_ supports `1000000`) Once complete you're ready to run the **Zephyr Tools: Load via Bootloader** command.

   ![Select baud](air-quality-wing/img/extension/select-baud.png)

## Testing it

Now you can get to playing around with some of the nRF9160 Feather example code! Remember you'll always have to open a terminal using the Toolchain Manager to build code!

You can quickly test if your SDK is set up correctly by checking out the [samples](nrf9160-example-code.md).
