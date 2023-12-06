SUMMARY = "Basic image for In-Vehicle Infotainment"

inherit infotainment-rpi-image

LINGUAS_KO_KR = "ko-kr"
LINGUAS_EN_US = "en-us"
IMAGE_LIGUAS = "${LINGUAS_KO_KR} ${LINGUAS_EN_US}"
IMAGE_OVERHEAD_FACTOR = "1.3"

IMAGE_INSTALL:append = " sudo"
inherit extrausers

EXTRA_USERS_PARAMS = " \
                      groupadd seame; \
                      useradd -p \$(openssl passwd 1234) team5; \
                      useradd -a -G sudo team5; \
                      useradd -g seame team5; \
"

update_sudoers() {
    sed -i 's/# %sudo/%sudo/' ${IMAGE_ROOTFS}/etc/sudoers
}

ROOTFS_POSTPROCESS_COMMAND += "update_sudoers;"

KIRKSTONE_LOCAL_GETTY ?= " \
                        ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service \
                        ${IMAGE_ROOTFS}${systemd_system_unitdir}/getty@.service \
"    
 
local_autologin () {
    sed -i -e 's/^\(ExecStart *=.*getty \)/\1--autologin root /' ${KIRKSTONE_LOCAL_GETTY}
}
 
ROOTFS_POSTPROCESS_COMMAND += "local_autologin;"

