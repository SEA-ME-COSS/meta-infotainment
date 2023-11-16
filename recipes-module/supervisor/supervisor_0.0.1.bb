SUMMARY = "Set supervisor for process manage"
LICENSE = "CLOSED"

SRC_URI = "file://conf.d"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${sysconfdir}/supervisor
    cp -r ${S}/conf.d/pdc.conf ${D}/${sysconfdir}/supervisor/
}
