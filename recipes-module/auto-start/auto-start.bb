SUMMARY = "Auto start the qt5 application"

LICENSE = "generic_CC-BY-SA-4.0"
LIC_FILES_CHKSUM = "file://${LAYERDIR}/licenses/${LICENSE};md5=fba3b94d88bfb9b81369b869a1e9a20f"

SRC_URI = "file://auto-start.sh"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}/profile.d
    install -m 0755 ${WORKDIR}/auto-start.sh ${D}${sysconfdir}/profile.d/auto-start.sh
}

FILES:{PN} += "${sysconfdir}"
