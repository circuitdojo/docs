# Example Code

![Examples](img/examples.png)

## Approved/pre-tested Examples

- Bluetooth to LTE Bridge
- Blinky Example
- `at_client` Example

## Asset Tracket Example

### Setting Up nRF Cloud

Here is an example using [HTTPie](https://httpie.org)

```
http POST https://api.nrfcloud.com/v1/devices/circuitdojo-test/certificates \
  Authorization:"Bearer d31c96f752a934894843ee887ab503b4c5029f03" <<< '2208' >> circuitdojo-test.certs.json
```

Then using LTE Link Monitor set the certs:

-[ ] Screen capture here

Here's an example using CURL

```
curl -X POST https://api.nrfcloud.com/v1/devices/<UID>/certificates \
  -H "Authorization: Bearer d31c96f752a934894843ee887ab503b4c5029f03" -d "2208"
```


```
http PUT https://api.nrfcloud.com/v1/association/352656103288901 \
  Authorization:"Bearer d31c96f752a934894843ee887ab503b4c5029f03" <<< '2208'
```

[Handy guide for loading new certs.](https://devzone.nordicsemi.com/nordic/cellular-iot-guides/b/getting-started-cellular/posts/nrf-cloud-certificate-update)


### Influx + Grafana + TrackMap

[TrackMap](https://grafana.com/grafana/plugins/pr0ps-trackmap-panel) is a plugin for Grafana
[Free Grafana Instance](https://grafana.com/products/cloud/?isource=hp)

You will still have to self-host an InfluxDB instance (or other data source).

Depending on your version. For Influx 2, here are the instructions:

```
influx -precision rfc3339
CREATE DATABASE location
USE location
CREATE USER feather WITH PASSWORD '<PASSWORD>'
GRANT WRITE ON location TO feather
```

This will allow you to write the data to Influx.

