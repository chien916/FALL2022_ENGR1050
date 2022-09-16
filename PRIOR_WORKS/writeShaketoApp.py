
import time
import board
import adafruit_lis3dh
import digitalio
from adafruit_ble import BLERadio
from adafruit_ble.advertising.standard import ProvideServicesAdvertisement
from adafruit_ble.services.nordic import UARTService

ble = BLERadio()
uart = UARTService()
advertisement = ProvideServicesAdvertisement(uart)

i2c = board.I2C()

# Lock the I2C device before we try to scan
while not i2c.try_lock():
    pass
# Print the addresses found once
print("I2C addresses found:", [hex(device_address) for device_address in i2c.scan()])

# Unlock I2C now that we're done scanning.
i2c.unlock()
int1 = digitalio.DigitalInOut(board.D6)
# Create library object on our I2C port
lis3dh = adafruit_lis3dh.LIS3DH_I2C(i2c, int1=int1)

while True:
    ble.start_advertising(advertisement)
    print("Waiting to connect")
    while not ble.connected:
        pass
    print("Connected")
    while ble.connected:
        try:
            disable =str(eval(uart.readline()))
        except Exception as e:
            disable = repr(e)

        s = lis3dh.shake(shake_threshold=10)
        if s:

            uart.write("Shaking")
