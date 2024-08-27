# Cellular Provider Matrix

![Cellular](/img/cellular.png)

In order to use a provider below you'll likely have to set the PDP context. For NCS >= 1.7.x you can set it in your `prj.conf` using the following config variables:

```
CONFIG_PDN=y
CONFIG_PDN_DEFAULTS_OVERRIDE=y
CONFIG_PDN_SYS_INIT=y
# Note: "ip" is set by PDN_DEFAULT_FAM kconfig's
# example:
# AT+CGDCONT=1,"ip","apn" - below only sets APN field
CONFIG_PDN_DEFAULT_APN="myapn"
CONFIG_PDN_DEFAULT_FAM_IPV4V6=y
```

(The above example is from [Nordic's Devzone.](https://devzone.nordicsemi.com/f/nordic-q-a/82891/pdp-usage))

There are also other configuration options like setting the authentication method, user name and password:

```
choice
	prompt "Authentication method"
	default PDN_DEFAULT_AUTH_NONE

config PDN_DEFAULT_AUTH_NONE
	bool "None"
config PDN_DEFAULT_AUTH_PAP
	bool "PAP"
config PDN_DEFAULT_AUTH_CHAP
	bool "CHAP"
endchoice

config PDN_DEFAULT_AUTH
	int
	default 0 if PDN_DEFAULT_AUTH_NONE
	default 1 if PDN_DEFAULT_AUTH_PAP
	default 2 if PDN_DEFAULT_AUTH_CHAP

config PDN_DEFAULT_USERNAME
	string "Username"
	depends on !PDN_DEFAULT_AUTH_NONE

config PDN_DEFAULT_PASSWORD
	string "Password"
	depends on !PDN_DEFAULT_AUTH_NONE
```

For NCS < 1.6.x, this can be done in your project's `prj.conf` in Zephyr. Here's an example of setting the PDP context to use Hologram.

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
| Hologram           | Sprint/AT&T/T-Mobile | The first SIM to get working out of the box. Also supports T-Mobile and Verizon connections. [Coverage info.](https://www.hologram.io/pricing/coverage#coverage-table) | ✅      | hologram   |
| Soracom            | AT&T/T-Mobile        | Working great from Circuit Dojo HQ. More info on coverage [here](https://developers.soracom.io/en/docs/reference/carriers/).                                           | ✅      | soracom.io |
| Verizon            | Verizon              | Use [Verizon ThingSpace](http://thingspaceportal.verizon.com) to get started quickly.                                                                                  | ✅      |            |
| Twilio (Super Sim) | T-Mobile and others  | Nordic indicates modem firmware 1.3.0 supports Twilio's Super Sim                                                                                                      | 🔶      | super      |
| AT&T               | AT&T                 | Tested indirectly via other MVNOs.                                                                                                                                     | 🔶      |            |

**Note:** are some important caveats about Verizon. [That information is located here.](nrf9160-verizon.md)

## NB IoT

| Provider Name                | Connected To | Notes                                                             | Working | APN |
| ---------------------------- | ------------ | ----------------------------------------------------------------- | ------- | --- |
| Twilio (Standard Narrowband) | T-Mobile     | T-Mobile does not support the nRF9160. This is subject to change. | 🔴      |     |

Emoji usage chart:

| Emoji | Note                   |
| ----- | ---------------------- |
| ✅    | Tested and working     |
| 🔶    | In progress            |
| 🔴    | Tested. Does not work! |

💡**Side note:** unless otherwise noted these are tested along the shoreline of Connecticut. Your mileage may vary so make sure you do your own testing
before adopting a provider.

## Customer reports

We don't always have the ability to test every single cellular provider. In this section, here are a few providers that customers have reported success with.

| Provider Name  | Connected To | Notes                                                                                          | APN  |
| -------------- | ------------ | ---------------------------------------------------------------------------------------------- | ---- |
| Teal           | ?            | In Canada (https://www.tealcom.io)                                                             | teal |
| At&t First Net | ?            | As reported by [Voxorin](https://community.circuitdojo.com/d/400-firstnet-att-simcard-working) |      |

For the latest information on which providers support the nRF9160 SiP check out [Nordic's nRF9160 certification page.](https://www.nordicsemi.com/Products/Low-power-cellular-IoT/nRF9160-Certifications)
