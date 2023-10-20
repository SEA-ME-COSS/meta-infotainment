SUMMARY = "Auto start the qt5 application"

LICENSE = "CLOSED"

SRC_URI = "file://auto-start.sh"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}/profile.d
    install -m 0755 ${WORKDIR}/auto-start.sh ${D}${sysconfdir}/profile.d/auto-start.sh
}

FILES:{PN} += "${sysconfdir}"
