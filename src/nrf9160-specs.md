# Specifications and Requirements

![Specs photo](img/specs.png)

Here are the elctrical specifications for the nRF9160 Feather. Most of the specifications here are based on the nRF9160 Product Specification. You can get the latest version of the [nRF9160 Product Specification here.](https://infocenter.nordicsemi.com/pdf/nRF9160_PS_v1.2.pdf) All previous versions can be [found here.](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fstruct_nrf91%2Fstruct%2Fnrf9160.html&cp=2_0)

## Board Supply

- **Output voltage:** 3.3V ± 0.3V
- **Max output current:** 800mA
- **Off current w/ Low Power RTC:** < 3µA

## Pin Ratings (MD/A0-A5/D0-D8)

- **Max input voltage:** 3.6V

## Enable Pin

- **Max input voltage:** 8V¹

¹Enable pin is *active low.*

## External Power Supply

The nRF9160 Feather can be powered via battery or USB. See below for the specifics for each power source

### USB Requirements

- **Operating range:** 5V ± 0.2V
- **Current requirements:** >500mA

### Battery Requirements

- **Battery type:** LiPoly
- **Operating range:** 2.8-5.5V
- **Current/power rating:** Able to support at least 2W of power
- **Battery capacity:** > 300mAH²
- **Charging current:** 294mA ± 10%

²*Batteries below this capacity are not recommended nor supported.*

## GPS Antenna

The U.FL port on the nRf9160 Feather is to be used with an **active GPS antenna only.**

- **Antenna supply voltage:** 3.3V ± 0.3V
- **Antenna current rating:** 15mA

The port works with most U.FL based active antenna parts. The nRF9160 Feather has been tested
and verified with the following parts:


| Part Number     | Manufacturerer    | Link         | GNSS (1602MHz) | Datasheet |
| --------------- | ----------------- | ------------ | -------------- | --------- |
| ACTPAT182-01-IP | Inventek Systems  | [Pricing][1] | No             | [Link][4] |
| APAGM2704A-C2G  | Abracon           | [Pricing][2] | Yes            | [Link][3] |
| GPSGB2530       | Pulse Electronics | [Pricing][6] | Yes            | [Link][5] |

**🔲 TODO: 1602 matters?**


[1]: https://octopart.com/actpat182-01-ip-inventek+systems-33601633?r=sp
[2]: https://octopart.com/apagm2704a-c2g-abracon-95402442?r=sp
[3]: https://abracon.com/datasheets/APAGM2704A-C2G.pdf
[4]: https://static6.arrow.com/aropdfconversion/422c439d1147508166bb2a384ddf266b0a8da68b/2actpat182_functional_specification.pdf
[5]: https://static6.arrow.com/aropdfconversion/2e87936e86246b09960dd14e8dd8cb37c651c97d/91gpsgbxxxx.pdf
[6]: https://octopart.com/gpsgb2530-pulse-77757372?r=sp


## Cellular Antenna

The nRF9160 Feather has been tested with these approved antennas:

| Part Number     | Manufacturerer | Link                      | Datasheet         |
| --------------- | -------------- | ------------------------- | ----------------- |
| FXUB63.07.0150C | Taoglas        | [Pricing][fxub63-pricing] | [Link][fxub63-ds] |
|                 |                | [Pricing][#]              | [Link][#]         |
|                 |                | [Pricing][#]              | [Link][#]         |

[fxub63-pricing]: https://octopart.com/fxub63.07.0150c-taoglas-48644609?r=sp
[fxub63-ds]: https://cdn.taoglas.com/datasheets/FXUB63.07.0150C.pdf
[#]: #

Any other antenna **may not be supported**. If you choose to use a different one, proceed at your own risk!