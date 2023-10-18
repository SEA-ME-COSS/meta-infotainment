SUMARRY = "Basic test code for CAN communication"
LICENSE = "CLOSED"

SRC_URI += "file://can-example.cpp"

S = "${WORKDIR}"

do_compile() {
    ${CXX} ${LDFLAGS} can-example.cpp -o can-example
}

do_install() {
    install -d ${D}${bindir}/example
    
    install -m 0755 can-example ${D}${bindir}/example/can-test
    install -m 0755 can-example.cpp ${D}${bindir}/example/can-test
}

FILES:${PN} += "${bindir}/example/can-test"
