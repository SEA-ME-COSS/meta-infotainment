#!/bin/bash

# Variables
DIR="build"
MACHINE="raspberrypi4-64"
LOCAL_CONF="${DIR}/conf/local.conf"

# Update or add a setting in local.conf
update_setting() {
    local key="$1"
    local value="$2"
    if grep -q "^${key} .*=" $LOCAL_CONF; then
        sed -i "s/^${key} .*=.*/${key} = \"${value}\"/" $LOCAL_CONF
    else
        echo "${key} = \"${value}\"" >> $LOCAL_CONF
    fi
}

# Initialize Poky environment
echo "Initializing Poky Environment..."
source poky/oe-init-build-env $DIR > /dev/null

# Add necessary layers
echo "Adding necessary layers..."
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-raspberrypi
bitbake-layers add-layer ../meta-qt5
bitbake-layers add-layer ../meta-infotainment

# Update local.conf with given settings
echo "Updating local.conf..."
update_setting "MACHINE" "${MACHINE}"
update_setting "ENABLE_I2C" "1"
# ... 여기에 다른 설정들을 추가하세요 ...
cat <<EOF >> $LOCAL_CONF

ENABLE_I2C = "1"
KERNEL_MODULE_AUTOLOAD:rpi += "i2c-dev i2c-bcm2708"
ENABLE_SPI_BUS = "1"
# ENABLE_CAN = "1"
# CAN_OSCILLATOR="16000000"
RPI_EXTRA_CONFIG = " \\
dtoverlay=spil-3cs \\
dtoverlay=mcp251xfd,spi0-0,interrupt=25 \\
dtoverlay=mcp251xfd,spi1-0,interrupt=24 \\
"
KERNEL_DEVICETREE:append = "overlays/mcp251xfd.dtbo"
DISTRO_FEATURES:append = " systemd"
DISTRO_FEATURES:remove = "sysvinit x11 vulkan"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
DISTRO_FEATURES_BACKFIL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscript = "systemd-compat-units"
MACHINE ??= "raspberrypi4-64"
DL_DIR ?= "\${TOPDIR}/downloads"
SSTATE_DIR ?= "\${TOPDIR}/sstate-cache"
TMPDIR = "\${TOPDIR}/tmp"
BB_NUMBER_THREADS = "16"
PARALLEL_MAKE = "-j 16"

EOF



echo "local.conf updated!"

echo "Setup completed!"

