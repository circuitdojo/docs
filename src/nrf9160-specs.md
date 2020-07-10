# Specifications and Requirements

![Specs photo](img/specs.png)

Here are the elctrical specifications for the nRF9160 Feather. Most of the specifications here are based on the nRF9160 Product Specification. You can get the latest version of the [nRF9160 Product Specification here.](https://infocenter.nordicsemi.com/pdf/nRF9160_PS_v1.2.pdf) All previous versions can be [found here.](https://infocenter.nordicsemi.com/index.jsp?topic=%2Fstruct_nrf91%2Fstruct%2Fnrf9160.html&cp=2_0)

## Board Supply

- **Output voltage:** 3.3V ± 0.3V
- **Max output current:** 800mA
- **Off current w/ Low Power RTC:** < 3µA

## Pin Ratings (MD/A0-A5/D0-D8/TX/RX/CIPO/COPI/SCK/RST)

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


| Part Number     | Manufacturerer   | Datasheet            | Notes                |
| --------------- | ---------------- | -------------------- | -------------------- |
| ACTPAT182-01-IP | Inventek Systems | [Link][actpat182-ds] | Offered w/ GroupGets |

[actpat182-ds]: https://static6.arrow.com/aropdfconversion/422c439d1147508166bb2a384ddf266b0a8da68b/2actpat182_functional_specification.pdf

## Cellular Antenna

The nRF9160 Feather has been tested with these approved antennas. They're chosen specifically to match the FCC requirements as indicated [here.](https://apps.fcc.gov/oetcf/tcb/reports/Tcb731GrantForm.cfm?mode=COPY&RequestTimeout=500&tcb_code=&application_id=5jPUJx5%2Bvjp3BKCESrEhWw%3D%3D&fcc_id=2ANPO00NRF9160)

| Part Number     | Manufacturerer        | Datasheet                  | Notes           |
| --------------- | --------------------- | -------------------------- | --------------- |
| FH2B4MH1F2F0100 | Unictron Technologies | [Link][uni-ds]             | Included        |
| ANT-LTE-RPC-UFL | Linx                  | [Link][ant-lte-rpc-ufl-ds] | GPS/GNSS, Rigid |

[uni-ds]: https://www.unictron.com/wp-content/uploads/H2B4MH1F2F0100.pdf
[uni-pricing]: https://octopart.com/h2b4mh1f2f0100-unictron-93186548?r=sp
[ant-lte-rpc-ufl-ds]: https://linxtechnologies.com/wp/wp-content/uploads/ant-lte-rpc-ccc-ds.pdf

**Only tested antennas are supported**. If you choose to use a different one, proceed at your own risk!