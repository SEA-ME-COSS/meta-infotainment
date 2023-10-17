SMARRY = "Basic test for vsomeip"
LICENSE = "CLOSED"

SRC_URI += " \
        file://CMakeLists.txt \
        file://src/ \
        file://src-gen-manager/ \
"

S = "${WORKDIR}"

inherit cmake

DEPENDS = " \
           common-api-c++ \
           vsomeip \
           common-api-c++-someip\
"

RDEPENDS:{PN} += " \
        common-api-c++ \
        vsomeip \
        common-api-c++-someip\
"

EXTRA_OECMAKE += " \
                -DCMAKE_INCLUDE_PATH=${STAGING_INCDIR} \
                -DCMAKE_LIBRARY_PATH=${STAGING_LIBDIR} \
"

