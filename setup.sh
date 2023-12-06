#!/bin/bash

# Variables
DIR="$(pwd)/build"
MACHINE="raspberrypi4-64"
LOCAL_CONF="${DIR}/conf/local.conf"
ADD_LOCAL_CONF="../meta-infotainment/tools/addlocal.conf"

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
bitbake-layers add-layer ../meta-qt5
bitbake-layers add-layer ../meta-infotainment

# Check if addlocal.conf exists
if [ -f "$ADD_LOCAL_CONF" ]; then
    # Append addlocal.conf to local.conf
    echo "Appending addlocal.conf to local.conf..."
    cat "$ADD_LOCAL_CONF" >> "$LOCAL_CONF"
    echo "addlocal.conf has been appended to local.conf"
else
    echo "Error: addlocal.conf does not exist."
fi

echo "Setup completed!"


echo "local.conf updated!"
echo "Setup completed!"

