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


| Part Number     | Manufacturerer    | Country of Origin | 1602MHz Capable | Datasheet | Notes                |
| --------------- | ----------------- | ----------------- | --------------- | --------- | -------------------- |
| ACTPAT182-01-IP | Inventek Systems  | Taiwan            | No              | [Link][4] | Offered w/ GroupGets |
| APAGM2704A-C2G  | Abracon           | China             | Yes             | [Link][3] |                      |
| GPSGB2530       | Pulse Electronics | China             | Yes             | [Link][5] |                      |


[1]: https://octopart.com/actpat182-01-ip-inventek+systems-33601633?r=sp
[2]: https://octopart.com/apagm2704a-c2g-abracon-95402442?r=sp
[3]: https://abracon.com/datasheets/APAGM2704A-C2G.pdf
[4]: https://static6.arrow.com/aropdfconversion/422c439d1147508166bb2a384ddf266b0a8da68b/2actpat182_functional_specification.pdf
[5]: https://static6.arrow.com/aropdfconversion/2e87936e86246b09960dd14e8dd8cb37c651c97d/91gpsgbxxxx.pdf
[6]: https://octopart.com/gpsgb2530-pulse-77757372?r=sp


## Cellular Antenna

The nRF9160 Feather has been tested with these approved antennas. They're chosen specifically to match the FCC requirements as indicated [here.](https://apps.fcc.gov/oetcf/tcb/reports/Tcb731GrantForm.cfm?mode=COPY&RequestTimeout=500&tcb_code=&application_id=5jPUJx5%2Bvjp3BKCESrEhWw%3D%3D&fcc_id=2ANPO00NRF9160)

| Part Number     | Manufacturerer        | Country of Origin | Datasheet                  | Notes    | Tested |
| --------------- | --------------------- | ----------------- | -------------------------- | -------- | ------ |
| FH2B4MH1F2F0100 | Unictron Technologies | Taiwan            | [Link][uni-ds]             | Included |        |
| SRFL026         | Antenova              | China             | [Link][SRFL026-ds]         |          | X      |
| W3907B0100      | Pulse Electronics     | China             | [Link][W3907B0100-ds]      |          |        |
| MFX3.07.0150C   | Taoglas               | Taiwan            | [Link][mfx3-ds]            |          |        |
| FXUB63.07.0150C | Taoglas               | Taiwan            | [Link][fxub63-ds]          | GPS/GNSS | X      |
| ANT-LTE-RPC-UFL | Linx                  | China             | [Link][ant-lte-rpc-ufl-ds] | GPS/GNSS |        |

[fxub63-pricing]: https://octopart.com/fxub63.07.0150c-taoglas-48644609?r=sp
[fxub63-ds]: https://cdn.taoglas.com/datasheets/FXUB63.07.0150C.pdf
[ant-lpl-pricing]: https://octopart.com/ant-lpl-fpc-100-linx-106001623?r=sp
[ant-lpl-ds]: https://linxtechnologies.com/wp/wp-content/uploads/ant-lpl-fpc-100-ds.pdf
[uni-ds]: https://www.unictron.com/wp-content/uploads/H2B4MH1F2F0100.pdf
[uni-pricing]: https://octopart.com/h2b4mh1f2f0100-unictron-93186548?r=sp
[mol-ds]: https://www.molex.com/pdm_docs/ps/2091420180-001.pdf
[mol-pricing]: https://octopart.com/search?q=2091420180&currency=USD&specs=0
[SRFL026-pricing]: https://octopart.com/srfl026-100-antenova-73285557?r=sp
[SRFL026-ds]: http://antenova.com/wp-content/uploads/2016/05/Mitis-SRFL026-PS-1.1.pdf
[W3907B0100-ds]: https://productfinder.pulseeng.com/doc_type/WEB301/doc_num/W3907XXXX/doc_part/W3907XXXX.pdf
[mfx3-ds]: https://cdn.taoglas.com/datasheets/MFX3.07.0150C.pdf
[ant-lte-rpc-ufl-ds]: https://linxtechnologies.com/wp/wp-content/uploads/ant-lte-rpc-ccc-ds.pdf

Any other antenna **are not supported**. If you choose to use a different one, proceed at your own risk!