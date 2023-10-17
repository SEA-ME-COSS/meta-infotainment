SUMMARY = "fejai"
LICENSE = "CLOSED"

SRC_URI = " \
            file://CMakeLists.txt \
            file://reboot_script \
            file://src \
            file://src-gen-desproject \
            "

S = "${WORKDIR}"

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
    cp -r ${S}/reboot_script ${D}${bindir}/headunit
}
