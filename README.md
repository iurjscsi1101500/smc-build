# smc-build
smc-build

# Dependencies
Install these packages to build the kernel.

## Arch
```sudo pacman --needed -S bc kmod libelf pahole cpio perl tar xz git```

## Debian/Ubuntu
```sudo apt install autoconf bc bison build-essential cpio curl debhelper dkms dwarves fakeroot flex gawk git kernel-wedge libcap-dev libelf-dev libiberty-dev libncurses-dev libpci-dev libssl-dev libudev-dev openssl python3 rsync wget xz-utils zstd```

## Fedora
```sudo dnf group install -y "Development Tools" && sudo dnf install -y autoconf bc bison cpio curl dkms dwarves elfutils-devel fakeroot flex gawk git kernel-wedge libcap-devel elfutils-libelf-devel libiberty ncurses-devel pciutils-devel openssl-devel systemd-devel openssl python3 rsync wget xz zstd```

# Build
Run `sudo ./build.sh`
