SUMMARY = "Genivi CommonAPI-SomeIP"

LICENSE = "MPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"

SRC_URI = "git://github.com/GENIVI/capicxx-someip-runtime.git;protocol=https;nobranch=1"
SRCREV = "0ad2bdc1807fc0f078b9f9368a47ff2f3366ed13"

S = "${WORKDIR}/git"

inherit cmake lib_package gitpkgv

DEPENDS += " \
        boost \ 
        common-api-c++ vsomeip \
        "

RDEPENDS:${PN}-dev += " \
                    vsomeip-dev \
                    "

EXTRA_OECMAKE += " \
                -DUSE_INSTALLED_COMMONAPI=ON \
                "

FILES:${PN}-dev += "${libdir}/cmake"

BBCLASSEXTEND = "nativesdk"
