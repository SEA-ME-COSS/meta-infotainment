SUMMARY = "A requests-like library for web interfacing"

HOMEPAGE = "https://github.com/adafruit/Adafruit_CircuitPython_Requests"
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.rst.license;md5=e0f14dd8dcf1f4554170a39243b3b74b"

SRC_URI = "https://files.pythonhosted.org/packages/77/73/7e07ccdbd821db85fe8ac70d6ecde74a82651b8d1dc992564583942076a6/adafruit-circuitpython-requests-1.12.5.tar.gz"
SRC_URI[md5sum] = "b03991f927df93a1877e77c09b78fd46"
SRC_URI[sha256sum] = "0f9af14be73b4ceb32b64aa6c2d832be1776a5e39a2a4e85618a4e6858b7996a"

S = "${WORKDIR}/adafruit-circuitpython-requests-1.12.5"

inherit setuptools3

DEPENDS += "python3-setuptools-scm-native"

RDEPENDS:${PN} += " \
    python3-adafruit-blinka \
    python3-core \
"

COMPATIBLE_HOST:libc-musl:class-target = "null"
