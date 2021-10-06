# Specifications

The Air Quality Wing v6 contains the following sensors and features:

* SHTC3 temperature and humidity sensor
  * Humidity range 0 - 100% (Accuracy ±2% RH)
  * Temperature range -25 - 100°C (Accuracy ±0.2°C)
  * Less than 1 μJ per measurement
  * 1.62 - 3.6V operation
  * 2 x 2 x 0.75 mm3 DFN package
  * Communicates via I2C

* SGP40 TVOC sensor
  * Voltage range of 1.7–3.6 V
  * Generates raw values that can be computed to relative air quality measurement in firmware
  * Sensor size 2.44 x 2.44 x 0.85mm
  * Always on average power consumption down to 2.6 mA/6 mW
  * Communicates via I2C

* HPMA115S0 PM2.5 sensor
  * Device power controlled by D5/PM2.5 EN pin
  * Onboard 5V boost power supply and bypass
  * Operates on both 5V and VBAT
  * Digital IO uses 3.3V
  * Provides both PM10 and PM2.5 values 
  * Measurement range 0-1000 μg/m3
  * Communicates via UART

* Additional power control to I2C devices via D4/I2C EN pin
* CR2 battery holder on bottom side (optional)

## Electrical

### Required input
- **3.3V Input**: 3.3V ± 0.3V

- **Battery Max Input**: 5.2V
- **Battery Min Input**: 3.0V 

- **5V Max Input**: 5.2V
- **5V Min Input**: 4.8V

### Enable Pins

- **Max Input**: 3.3V ± 0.3V

### Recommended Communication Speeds

- **I2C:** 100KHz
- **UART:** 9600 BAUD