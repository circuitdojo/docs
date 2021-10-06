# Changelog

## v6 - (October 2021)

**Changed:**

* Formfactor to standard Feather size
* Replaced temperature/humidity sensor with SHTC3
* Replaced TVOC sensor with SGP40
* Changed MCP1640 package to DSON from SOT23-5
* Hatched ground planes on both top and bottom
* Re-designed sensor placement
* Thermal isolation slots for SHTC3
* Pinout for PM2.5 connector reverted back to original design (allows for bidirectional use of cable)

**Added:**

* Added I2C power control to D4
* Added battery backpack (CR2 holder)

## v4

- Relocated the Si7021 to a separate "lily pad" for heat isolation

## v3

- Fixed bug related supply voltage not being stable to the HPMTA115S0
- Relocated D7 to D5 for CCS811 reset signal
- Changed connector pinout. That way the cable does't have to be twisted.

## v2

- Added ferrite to shunt noise
- Swapped out MCP1624 with MCP1640