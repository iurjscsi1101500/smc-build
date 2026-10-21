#!/bin/bash

mkdir build && cd build
git clone https://github.com/t2linux/linux-t2-patches
cd linux-t2-patches
git checkout 7.3
cd ..
git clone https://github.com/torvalds/linux.git --depth=1
cd linux
git apply ../linux-t2-patches/30*.patch
make localmodconfig
./scripts/config --disable CONFIG_SENSORS_APPLESMC
./scripts/config --module CONFIG_IIO
./scripts/config --module CONFIG_MFD_MACSMC_CORE
./scripts/config --module CONFIG_MACSMC_ACPI
./scripts/config --module CONFIG_RTC_DRV_MACSMC
./scripts/config --module CONFIG_MACSMC_WDT
./scripts/config --module CONFIG_MACSMC_LIGHT
./scripts/config --module CONFIG_MACSMC_ACCEL
./scripts/config --module CONFIG_LEDS_MACSMC
./scripts/config --module CONFIG_SENSORS_MACSMC_HWMON
./scripts/config --module CONFIG_MACSMC_POWER
make -j$(nproc) && make modules_install -j$(nproc) && make install
cd ..
rm -rf build
reboot
