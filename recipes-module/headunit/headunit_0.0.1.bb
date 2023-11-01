SUMMARY = "Head Unit made by Qt5"

LICENSE = "CC-BY-SA-4.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=fba3b94d88bfb9b81369b869a1e9a20f"

SRC_URI = "git://github.com/SEA-ME-COSS/DES-Head-Unit.git;protocol=https;branch=kirkstone"
SRCREV = "1f99d970aca43da3a02511a21ab87f14f157a0ff"

S = "${WORKDIR}/git"

inherit cmake_qt5

DEPENDS = " \
           common-api-c++ \
           vsomeip \
           common-api-c++-someip \
           qtbase \
           qtquickcontrols2 \
           qtmultimedia \
           python3 \
"

EXTRA_OECMAKE += " \
                -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} \
                -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR} \
"

do_install:append() {
    cp -r ${S}/can-setup.sh ${D}${bindir}/headunit
}
