#!/bin/bash

# Variables
DIR="$(pwd)/build"
MACHINE="raspberrypi4-64"
LOCAL_CONF="${DIR}/conf/local.conf"

# Initialize Poky environment
echo "Initializing Poky Environment..."
source oe-init-build-env $DIR > /dev/null

# Modify meta-raspberrypi conf
echo "Modifying meta-raspberrypi conf..."
sed -i 's/LAYERSERIES_COMPAT_raspberrypi = "nanbield"/LAYERSERIES_COMPAT_raspberrypi = "kirkstone"/' ../meta-raspberrypi/conf/layer.conf

# Add necessary layers
echo "Adding necessary layers..."
bitbake-layers add-layer ../meta-raspberrypi
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-qt5
bitbake-layers add-layer ../meta-infotainment

# Update local.conf with given settings
echo "Updating local.conf..."
cat <<EOF >> $LOCAL_CONF
# Setting for CAN 2-CH FD
KERNEL_DEVICETREE:append = " \
                        overlays/mcp251xfd.dtbo \
"

# Setting for i2c
ENABLE_I2C = "1"
KERNEL_MODULE_AUTOLOAD:rpi += "i2c-dev i2c-bcm2708"

# Add dtbo files for waveshare 7.9inch LCD
KERNEL_DEVICETREE:append = " \
                        overlays/vc4-kms-dsi-waveshare-panel.dtbo \
"

# Install dtbo for waveshare 7.9inch LCD
RPI_EXTRA_CONFIG += " \n\
dtoverlay=vc4-kms-dsi-waveshare-panel,7_9_inch \n\
"
 
# Set systemd instead sysV
DISTRO_FEATURES:append = " systemd"
DISTRO_FEATURES:remove = "sysvinit"
VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
DISTRO_FEATURES_BACKFIL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscript = "systemd-compat-units"

# Set X11 for Qt
DISTRO_FEATURES:remove = "wayland vulkan"
DISTRO_FEATURES:append = " X11"

# Ignore old license error
LICENSE_FLAGS_ACCEPTED += "synaptics-killswitch"

# Set for qt5 gstreamer
LICENSE_FLAGS_ACCEPTED = "commercial"
PACKAGECONFIG:append_pn-qtmultimedia=" gstreamer1.0"
PACKAGECONFIG:append_pn-gstreamer1.0-plugins-bad = " hls"

# For raspberrypi4
MACHINE = "raspberrypi4-64"

EOF

echo "local.conf updated!"
echo "Setup completed!"

