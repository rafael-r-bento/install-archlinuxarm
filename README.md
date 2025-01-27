# Install Arch Linux ARM

Script to automate installation of ArchLinux ARM to micro SD card.

The script is based on [Raspberry Pi Zero 2 Installation Process](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-zero-2)
from ArchLinux ARM community web-site.

## Important

Script requires root permissions, or sudo rights.

Be careful, since **you will loose all your data** on the device which name is passed to the script:
 * Do a backup first!
 * Supply a correct device name!
 * You have 1 chance to interrupt the process.

## Usage

Run script with a device name as first parameter and follow the instructions.

```bash
$ sudo ./install_archlinux_rpi.sh sdb

Going to install ArchLinux (Raspberry Pi Zero 2) on device '/dev/sdb'

All data on this device will be lost!
Do you want to continue? (y/N):
...
```

## Links

 * [Arch Linux ARM - Raspberry Pi Zero 2 page](https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-zero-2)
