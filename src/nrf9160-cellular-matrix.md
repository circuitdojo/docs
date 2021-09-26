# Cellular Provider Matrix

![Cellular](img/cellular.png)

In order to use a provider below you'll likely have to set the PDP context. For NCS < 1.6.x, this can be done in your project's `prj.conf` in Zephyr. Here's an example of setting the PDP context to use Hologram.

```
# Set the PDP context
CONFIG_LTE_LINK_CONTROL=y
CONFIG_LTE_PDP_CMD=y
CONFIG_LTE_PDP_CONTEXT="0,\"IP\",\"hologram\""
```

Simply replace `hologram` with a provider specific APN and you'll be good to go.

Some providers also require a username and password. For example, here's what Soracom's looks like:

```
CONFIG_LTE_PDN_AUTH_CMD=y
CONFIG_LTE_PDN_AUTH="0,\"PAP\",\"sora\",\"sora\""
```

**Side note:** in the case of both Hologram an Soracom you **do not** need the PDP context to transfer data.

Here's a full working list of what plays nicely with the nRF9160 Feather. This list is subject to change at any time.

## LTE

| Provider Name      | Connected To         | Notes                                                                                                                                                                  | Working | APN        |
| ------------------ | -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ---------- |
| Hologram           | Sprint/AT&T/T-Mobile | The first SIM to get working out of the box. Also supports T-Mobile and Verizon connections. [Coverage info.](https://www.hologram.io/pricing/coverage#coverage-table) | ✅       | hologram   |
| Soracom            | AT&T/T-Mobile        | Working great from Circuit Dojo HQ. More info on coverage [here](https://developers.soracom.io/en/docs/reference/carriers/).                                           | ✅       | soracom.io |
| Verizon            | Verizon              | Use [Verizon ThingSpace](http://thingspaceportal.verizon.com) to get starte quickly.                                                                                   | ✅       |            |
| Twilio (Super Sim) | T-Mobile and others  | Nordic indicates modem firmware 1.3.0 supports Twilio's Super Sim                                                                                                      | 🔶       | super      |
| AT&T               | AT&T                 | Tested indirectly via other MVNOs.                                                                                                                                     | 🔶       |            |

**Note:** are some important caveats about Verizon. [That information is located here.](nrf9160-verizon.md)

## NB IoT

| Provider Name                | Connected To | Notes                                                             | Working | APN |
| ---------------------------- | ------------ | ----------------------------------------------------------------- | ------- | --- |
| Twilio (Standard Narrowband) | T-Mobile     | T-Mobile does not support the nRF9160. This is subject to change. | 🔴       |     |

Emoji usage chart:

| Emoji | Note                   |
| ----- | ---------------------- |
| ✅     | Tested and working     |
| 🔶     | In progress            |
| 🔴     | Tested. Does not work! |

💡**Side note:** unless otherwise noted these are tested along the shoreline of Connecticut. Your mileage may vary so make sure you do your own testing
before adopting a provider.

## Customer reports

We don't always have the ability to test every single cellular provider. In this section, here are a few providers that customers have reported success with.

| Provider Name | Connected To | Notes | APN |
| ------------- | ------------ | ----- | --- |
|               |              |       |     |

For the latest information on which providers support the nRF9160 SiP check out [Nordic's nRF9160 certification page.](https://www.nordicsemi.com/Products/Low-power-cellular-IoT/nRF9160-Certifications)
