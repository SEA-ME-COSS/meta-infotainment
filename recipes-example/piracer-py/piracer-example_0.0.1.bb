SUMMARY = "Basic sample code for piracer"

LICENSE = "CLOSED"

SRC_URI += "file://forward_backward_left_right.py"

do_install() {
    install -d ${D}{bindir}/example
    install -m 0755 forward_backward_left_right.py ${D}${bindir}/example/piracer-example
}

FILES:{PN} += "${bindir}/example/piracer-example"
