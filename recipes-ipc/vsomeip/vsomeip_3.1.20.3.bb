SUMMARY = "the implementation of SOME/IP"

LICENSE = "MPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"

SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https;nobranch=1"
SRCREV = "13f9c89ced6ffaeb1faf485152e27e1f40d234cd"

S = "${WORKDIR}/git"

inherit cmake lib_package gitpkgv

DEPENDS += " \
        boost \
        dlt-daemon \
        "

do_install:append() {
    mv ${D}/usr/etc ${D}
    rm -rf ${D}/etc/vsomeip/*
}  

PACKAGES:remove = "${PN}-bin"

FILES:${PN} += "${bindir}/vsomeipd ${sysconfdir}/${BPN}"
FILES:${PN}-dev += "${libdir}/cmake"

BBCLASSEXTEND = "nativesdk"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
