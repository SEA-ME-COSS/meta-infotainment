SUMMARY = "Simple helloworld application"

LICENSE = "CLOSED"

SRC_URI += " \
        file://c_example.c \
        file://cpp_example.cpp \
"

S = "${WORKDIR}"

do_compile() {
    ${CC} ${LDFLAGS} c_example.c -o c_example
    ${CXX} ${LDFLAGS} cpp_example.cpp -o cpp_example
}

do_install() {
    install -d ${D}${bindir}/example
    
    install -m 0755 c_example ${D}${bindir}/example/helloworld
    install -m 0755 c_example.c ${D}${bindir}/example/helloworld

    install -m 0755 cpp_example ${D}${bindir}/example/helloworld
    install -m 0755 cpp_example.cpp ${D}${bindir}/example/helloworld
}

FILES:${PN} += "${bindir}/example/helloworld"

