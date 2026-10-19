#!/bin/bash
set +e

if [ -f "/sys/class/leds/macsmc-led/brightness" ]; then
	echo "Testing Keyboard backlight"
	default_value=$(cat /sys/class/leds/macsmc-led/brightness)
	echo "Setting 0 (the keyboard backlight should be completely dark)"
	echo "0" > /sys/class/leds/macsmc-led/brightness
	sleep 10
	echo "Setting 255 (the keyboard backlight should be completely bright)"
	echo "255" > /sys/class/leds/macsmc-led/brightness
	sleep 10
	echo "Resetting Value"
	echo "$default_value" > /sys/class/leds/macsmc-led/brightness
else
	echo "SMC Keyboard backlight dosent exist"
fi


echo "Lsmod: " > test.txt
lsmod >> test.txt
echo "Dmesg: " >> test.txt
dmesg >> test.txt
echo "IIO Devices: " >> test.txt
grep -H . /sys/bus/iio/devices/iio:device*/{name,in_*_raw,in_*_input} >> test.txt
echo "Sensors: " >> test.txt
grep -H . /sys/class/hwmon*/{fan*,temp*,volt*,power*} >> test.txt
echo "Battery/AC: " >> test.txt
grep -H . /sys/class/power_supply/*/uevent >> test.txt
