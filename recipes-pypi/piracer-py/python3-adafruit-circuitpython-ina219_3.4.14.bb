SUMMARY = "CircuitPython library for INA219 high side DC current sensor."

HOMEPAGE = "https://github.com/adafruit/Adafruit_CircuitPython_INA219"
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.rst.license;md5=e0f14dd8dcf1f4554170a39243b3b74b"

SRC_URI = "https://files.pythonhosted.org/packages/2d/46/be441d687c642f84adf8a965d7c1ab2bab9e22a69a7eb1852a52e6309988/adafruit-circuitpython-ina219-3.4.14.tar.gz"
SRC_URI[md5sum] = "76929af29af4ea784df1d22144c68753"
SRC_URI[sha256sum] = "fcf04aba6ab07a160663280a32474010d055eb9eaf6efebb5462483a7cef4217"

S = "${WORKDIR}/adafruit-circuitpython-ina219-3.4.14"

inherit setuptools3

DEPENDS += "python3-setuptools-scm-native"

RDEPENDS:${PN} = " \
    python3-adafruit-blinka \
    python3-adafruit-circuitpython-register \
    python3-adafruit-circuitpython-busdevice \
    python3-core \
"

COMPATIBLE_HOST:libc-musl:class-target = "null"
