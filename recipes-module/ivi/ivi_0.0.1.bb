SUMMARY = "In-Vehicle Infotainment made by Qt5"

LICENSE = "CC-BY-SA-4.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=fba3b94d88bfb9b81369b869a1e9a20f"

SRC_URI = "git://github.com/SEA-ME-COSS/In-Vehicle-Infotainment.git;protocol=https;branch=kirkstone"
SRCREV = "5c75f21518aec27a8537c719496d7ee4d71eaa27"

S = "${WORKDIR}/git"

inherit cmake_qt5

DEPENDS = " \
           common-api-c++ \
           vsomeip \
           common-api-c++-someip \
           qtbase \
           qtmultimedia \
           python3 \
           qtwayland \
"

EXTRA_OECMAKE += " \
                -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} \
                -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR} \
"

do_install:append() {
    cp -r ${S}/can-setup.sh ${D}${bindir}/pdc
}
