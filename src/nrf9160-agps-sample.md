# nRF Cloud AGPS Sample

The `nrf_cloud_agps` sample is the *easiest* way to get started with generating GPS coordinates with your nRF9160 Feather.


## Precompiled Binary

**Note:** you can get a pre-build binary file compiled previously using NCS v1.3.2 [here](files/nrf_cloud_agps_bb259bf.bin).


## Programming `nrf_cloud_apgs` **Sample**

1. Change directories to `ncs/nrf` (Make sure you're using NCS v1.4.0 or newer.)
2. Then change directories to `/nrf/samples/nrf9160/agps/`
3. Add this to `prj.conf`:
   ```
   # Cloud prefix for nRF9160 Feather
   CONFIG_NRF_CLOUD_CLIENT_ID_PREFIX="feather-"

   # Image manager
   CONFIG_IMG_MANAGER=y
   CONFIG_FLASH=y
   CONFIG_IMG_ERASE_PROGRESSIVELY=y

   # Enable Zephyr application to be booted by MCUboot
   CONFIG_BOOTLOADER_MCUBOOT=y

   # COEX0 is used to enable the GPS LNA, but it has to be configured to do so.
   CONFIG_NRF9160_GPS_SET_COEX0=y
   CONFIG_NRF9160_GPS_COEX0_STRING="AT%XCOEX0=1,1,1565,1586"
   ```

Then compile as normal:

```
west build -b circuitdojo_feather_nrf9160ns
```

**Note:** having trouble building? Make sure you check out the [troubleshooting](nrf9160-troubleshooting.md) page.

Then load using `newmgr`:

```
newtmgr -c serial image upload build/zephyr/app_update.bin
newtmgr -c serial reset
```

## Setting Up nRF Connect for Cloud

During factory test, your nRF9160 Feather is added to nRF Connect for Cloud for your immediate use! The only thing you'll need, other than your nRF9160 Feather, SIM and antenna is your getting started card:

![Cloud Code](/img/agps-sample/nrf-cloud-code.jpg)

Every nRF9160 Feather has a device ID generated based on the IMEI. Your full device ID will look something like:

`feather-<IMEI>` where `<IMEI>` is the IMEI tied to your specific device. 

**Note:** You can get the IMEI by running the `AT+CGSN=1` command in LTE Link Monitor while running the `at_client`, default factory firmware or other firmware with AT Commands turned on. 

Here are the steps to get you the rest of the way.

1. First, program your device with the `nrf_cloud_agps` sample.
2. Then, power up and confirm that the device can connect to the cloud.
3. Create an nRF Connect for Cloud Account
   ![Add new device](img/agps-sample/add-new-device.png)
4. Once created, go to the top left and click the big **+** icon.
   ![Add LTE device](img/agps-sample/add-lte-device.png)
5. Then skip the iBasis setup since we're using Hologram.
   ![Skip iBasis](img/agps-sample/skip-ibasis-setup.png)
6. Enter the Device ID and the PIN provided on your card.
   ![Enter device ID and pin](img/agps-sample/enter-device-id-and-pin.png)
7. Once you press **Add Device**, nRF Connect for Cloud should notify you that your device has been added!
8. Navigate to **Devices** and click on the device you're working wtih!
   ![Devices](img/agps-sample/devices.png)

That's it!

Your device screen will adapt to the example code that you're using. For example, it should display a map when you begin to publish GPS data.

![nRF Connect for Cloud Screenshot with map](img/agps-sample/nrf-cloud-screenshot.png)

### Troubleshooting

There are some things that can go wrong here. They're usually related to your nRF Cloud certs.

Reloading the certs can be done using the [tutorial here.](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fug_nrf91_dk_gsg%2FUG%2Fnrf91_DK_gsg%2Fupdating_certificates.html)
