# Verizon operation

Versions of the nRF9160 Feather < v4 are supported on Verizon. If you've been chomping at the bit to get running on their newtwork, here's your chance!

## Requirements

There are some requirements related to the use of Verizon's network. Here are the details:

1. You **must** use Modem Firmware v1.1.2. The v1.2.x branch of the modem firmware is not supported (and will never be supported) on Verizon. You can check what version of the Modem Firmware you're running by executing this AT command: `AT+CGMR`. It will print something similar to `nrf9160_1.1.2` Note: if you're running an older version of modem firmware you may have to use the `%SHORTSWVER` command.

    If you're not on 1.1.2 make sure you update using [the guide here.](nrf9160-nrf-connect-desktop.md#updating-modem-firmware)
1. For production deployments, you **must** use the 1.2.x branch of the nRF Connect SDK.
1. If you've purchased a genuine nRF9160 Feather, your IMEI will already be added to Verizon's network. To get started, create a [Verizon ThingSpace](https://thingspace.verizon.com) account. There you'll be able to create a new line with your nRF9160 Feather's IMEI.

    You can get your IMEI by running the `AT+CGSN=1` command. The reply should look someting like this:
     ```
     AT+CGSN=1
     +CGSN: "352656100367872"
      OK
      ```
1. Finally, any device on Verizon's network **must** be running the LWM2M Carrier Library. This allows Verizon to update the modem firmware in the event it's necessary. Enabling the LWM2M carrier library is as simple as adding `CONFIG_LWM2M_CARRIER=y` to your `prj.conf`.