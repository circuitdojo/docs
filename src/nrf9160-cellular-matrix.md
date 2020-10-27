# Cellular Provider Matrix

![Cellular](img/cellular.png)

Here are some results from recent testing of the nRF9160 Feather. As of this writing, the nRF9160 Fether is not an end certified deivce. That means there is limited support for all the known networks in the USA.

**Note:** End device certification is underway with Verizon! Estimated completion is mid to late August.

In order to use a provider below you'll likely have to set the PDP context. This can be done in your project's `prj.conf` in Zephyr. Here's an example of setting the PDP context to use Hologram.

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

Here's a full working list of what plays nicely with the nRF9160 Feather. This list is subject to change at any time.

## LTE

| Provider Name             | Connected To | Notes                                                                                                                                                                  | Working | APN        |
| ------------------------- | ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ---------- |
| Hologram                  | Sprint/AT&T  | The first SIM to get working out of the box. Also supports T-Mobile and Verizon connections. [Coverage info.](https://www.hologram.io/pricing/coverage#coverage-table) | ✅       | hologram   |
| Soracom                   | AT&T         | Tested previously with a different module in this location. Will test again with the nRF9160. PDN user/pass: `sora`/`sora` (not required)                              | ✅       | soracom.io |
| Verizon                   | Verizon      | Works greaet once the IMEI is cleared with Verizon. More to come here..                                                                                                | ✅       |            |
| Twilio (Standard Wireles) | T-Mobile     | T-Mobile does not support the nRF9160.                                                                                                                                 | 🔴       |            |
| Twilio (Super Sim)        | ?            | Fails to make a full connection. May work with future nRF9160 modem firmware.                                                                                          | 🔴       | super      |
| AT&T                      | AT&T         | Untested.                                                                                                                                                              | 🔶       |            |

## NB IoT

| Provider Name                | Connected To | Notes                                  | Working | APN |
| ---------------------------- | ------------ | -------------------------------------- | ------- | --- |
| Twilio (Standard Narrowband) | T-Mobile     | T-Mobile does not support the nRF9160. | 🔴       |     |

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

| Provider Name | Connected To | Notes                                                                   | APN |
| ------------- | ------------ | ----------------------------------------------------------------------- | --- |
| Kore          | Verizon/AT&T | Provides separate SIM cards for Verizon/AT&T. AT&T ESIM also available. |     |

For the latest information on which providers support the nRF9160 SiP check out [Nordic's nRF9160 certification page.](https://www.nordicsemi.com/Products/Low-power-cellular-IoT/nRF9160-Certifications)
