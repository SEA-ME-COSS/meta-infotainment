SUMMARY = "Types needed for type annotation that are not in `typing`"

HOMEPAGE = "https://github.com/adafruit/Adafruit_CircuitPython_Typing"
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.rst.license;md5=5945909edcc0d41f570a77794a1ae141"

SRC_URI = "https://files.pythonhosted.org/packages/5f/36/e600e4aebafc447b0db7784aff7b8b9a8f7a6b13c8e15d07c8ee3ea88e9e/adafruit-circuitpython-typing-1.7.1.tar.gz"
SRC_URI[md5sum] = "7e33200dd15e7880b1eb22dd98221da9"
SRC_URI[sha256sum] = "30051d7f2a5eeaed67d72cbae5a627fab7be97f2dede2f47d1385d7d8dee2474"

S = "${WORKDIR}/adafruit-circuitpython-typing-1.7.1"

inherit setuptools3

DEPENDS += "python3-setuptools-scm-native"

RDEPENDS:${PN} += " \
    python3-adafruit-blinka \
    python3-adafruit-circuitpython-busdevice \
    python3-adafruit-circuitpython-requests \
    python3-typing-extensions \
    python3-core \
"

COMPATIBLE_HOST:libc-musl:class-target = "null"
