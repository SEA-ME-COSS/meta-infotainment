# meta-infotainment


This is the layer for head-unit fit in OpenEmbedded/Yocto.

Details of Head-Unit, go to [DES-Head-Unit](https://github.com/SEA-ME-COSS/DES-Head-Unit)
  

# Dependencies


This layher depends on:

- URI: [https://github.com/yoctoproject/poky](https://github.com/yoctoproject/poky)
    - branch : kirkstone
    - revision : 4.0.12

- URI: [https://github.com/openembedded/openembedded-core](https://github.com/openembedded/openembedded-core.git)
    - branch : kirkstone
    - commit : 482d864b8f1af84915ed6a9641e80af4e49a1f63

- URI: [https://github.com/agherzan/meta-raspberrypi](https://github.com/agherzan/meta-raspberrypi.git)
    - branch : master
    - commit : 59a6a1b5dd1e21189adec49c61eae04ed3e70338

- URI: [https://github.com/meta-qt5/meta-qt5](https://github.com/meta-qt5/meta-qt5.git)
    - branch : kirkstone
    - commit : ae8a97f79364bed1abc297636f7933d0e35f22be
  

# Quick Start


Install basic environment for yocto.

```bash
sudo apt-get update
sudo apt-get upgrade

sudo apt install bmap-tools zstd liblz4-tool gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm python

sudo apt install curl
```

 Install the [repo](https://source.android.com/docs/setup/download/downloading?hl=ko#installing-repo) command by Google first.

```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH
```

## Create workspace

```bash
mkdir yocto-infotainment && cd yocto-infotainment
repo init -u https://github.com/SEA-ME-COSS/meta-infotainment -b kirkstone -m tools/headunit-yocto.xml
repo sync
repo start work --all
```

## Update existing workspace

In order to bring all the layers up to date with upstream

```bash
cd yocto-infotainment
repo sync
repo rebase
```

## Setup Build Environment

```bash
cd poky
. ./meta-infotainment/setup.sh
```

## Disable auto-start

If you want to disable auto-start

```bash
bitbake infotainment-rpi-image -c clean
bitbake infotainment-rpi-image -e SKIP_AUTO_START=1
```
  

# Build Images


This headunit works fully on Raspberry Pi 4 with full hardware setup.

```bash
bitbake infotainment-rpi-image
```

If you want to test in 64-bit machine in QEMU using the following command:

```bash
MACHINE=qemux86-64 runqemu nographic
```
  

# Download Image


1. Find where SD card is
    
    ```bash
    sudo fdisk -l
    ```
    
2. Write image to SD card
    
    You should write rpi-sdimg.
    
    ```bash
    cd tmp/deploy/images/raspberrypi4-64
    sudo dd if=infotainment-rpi-image-raspberrypi4-64-[timewhenyoubuild].rootfs.rpi-sdimg of=/dev/sda
    sync
    ```
  

# Details


If you want to know details about yocto, go to docs
  

# References


- [Yocto Project](https://docs.yoctoproject.org/4.0.12/migration-guides/migration-4.0.html)
- [Meta-raspberrypi](https://meta-raspberrypi.readthedocs.io/en/latest/index.html)
- [Meta-Qt](https://koansoftware.com/pub/talks/QtDay-2019/QtDay2019-Koan.pdf)
