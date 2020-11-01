# Troubleshooting

This page has a list of common problems and solutions realated to the nRF9160 Feather.

## Programming problems

**Problem found:** the nRF9160 Feather does nothing after being programmed/flashed.

**Solution:** after being programmed using `west flash`, you may have to issue an additional `nrfjprog -r` or hit the `RST` button on the board. This should start code execution.

## GPS Connection issues

**Problem found:** unable to get a fix after waiting a long time. (Using the [`gps` example.](nrf9160-example-code.md)

**Potential solution:*** If your nRF9160 Feather is plugged into USB, try a different USB power supply. During the testing of the nRF9160 Feather, I found that certain USB C-to-A adapters injected were not properly grounded. This lead to issues getting a fix or prevented it all together. This especially applied to Apple Macbooks.

## "The toolchain is unable to build a dummy C file" (Mac OS)

If you're trying to build an example and you're getting an error building your code your should delete the `Cmake` cache:

```bash
rm -rf ~/Library/Caches/zephyr
```

More info here: [https://devzone.nordicsemi.com/f/nordic-q-a/55475/the-toolchain-is-unable-to-build-a-dummy-c-file](https://devzone.nordicsemi.com/f/nordic-q-a/55475/the-toolchain-is-unable-to-build-a-dummy-c-file)