SUMMARY = "Set supervisor for process manage"
LICENSE = "CLOSED"

SRC_URI = "file://conf.d"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}/supervisor/conf.d
    install -m 0644 ${S}/conf.d/pdc.conf ${D}${sysconfdir}/supervisor/conf.d/
}
