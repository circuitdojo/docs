# Changelog

## Hardware

### v6 - (May 2024)

- Addressed issue with current draw when VBAT > 3.6V

### v5 - (October 2022)

- No longer supports complete shutdown mode
- Using nRF9160 B1A variant
- Now supports "buttonless" DFU mode
- Now supports direct USB-C connection

Added:

- Ferrite and 47u for power inputs
- Additional bypass to match nRF9160 reference

Changed:

- Relocated CP2102 closer to USB connector
- Improved ground return paths
- Pins reference nRF9160 pin numbers
- Changed 47uf cap to 4.7u for B1 variant
- Replaced Buck with TPS62840
- Added jumper for disabling charger
- Added current resistors for CC pins
- Added connections to RESET and MODE pins to CP2102 for buttonless DFU mode entry
- Moved SIM holder
- Re-routed battery measurement circuit
- Replace charger with BQ25170JDSGR and updated supporting passives

Removed:

- Reference designators

### v4 - (October 2021)

Changed:

- Changed power supply to use TI's LM3281
- USB connector to USB-C
- Changed schottky diode part to make more room for USB-C
- Updated 3D render
- Renamed LNA_EN to GPS_EN to avoid confusion
- Charging LED fed by 5V
- Replaced battery charger with Microchip MCP73830T
- Improved/cleaned up power and return paths
- INT1 is now an optional jumper

Added:

- Added INT2 connection for accelerometer with closed jumper
- A0 and MODE pin of LM3281 connected for PWM/PFM control

### v3 - (July 2021)

- Fixed SCL/SDA labels
- Added test points for SIM tests

### v2 - (Jan 2021)

![Backside of nRF9160 Feather V2](/img/v2-backside.png)

- Added 3-axis Accelerometer by ST (LIS2DH12TR). Zephyr/nRF Connect SDK includes built-in support for this chip.
- Added Accelerometer INT1 pin to Pin 2 on the board.
- Added JMP1 to free up use for Pin 2 (INT1 pin on LIS2DH is push/pull an always on)
- The power supply enable signal, which originally was inaccessible, is now available next to the TX pin.
- Added JMP2 to disable PS_EN's connection to the power supply. "Always on" operation by shorting the middle and right pads on JMP2.
- Updated the bottom side labels thanks to Sparkfun's Buzzard tool. They deserve all the credit there!

## Software

### NFED (nRF9160 Feather Examples and Drivers) - (Jan 2021)

- Added accelerometer sample
- Added bme280 sample
