SUMMARY = "CircuitPython library for SSD1306 OLED displays."

HOMEPAGE = "https://github.com/adafruit/Adafruit_CircuitPython_SSD1306"
AUTHOR = " <Adafruit Industries <circuitpython@adafruit.com>>"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://README.rst.license;md5=e0f14dd8dcf1f4554170a39243b3b74b"

SRC_URI = "https://files.pythonhosted.org/packages/ad/9d/c0f07c69f408a633ed2533e4832ac5e6813aa4fe3dc80731bdbb9d4f1e88/adafruit-circuitpython-ssd1306-2.12.7.tar.gz"
SRC_URI[md5sum] = "e10959cd0793bd56760c12a36f851cfb"
SRC_URI[sha256sum] = "b64445ec2317c8e05a3f4cfa5f3a72a7b8444c2cbfa6f6f0aca824c3d1534902"

S = "${WORKDIR}/adafruit-circuitpython-ssd1306-2.12.7"

inherit setuptools3

DEPENDS += "python3-setuptools-scm-native"

RDEPENDS:${PN} += " \
    python3-adafruit-blinka \
    python3-adafruit-circuitpython-busdevice \
    python3-adafruit-circuitpython-framebuf \
    python3-core \
"

COMPATIBLE_HOST:libc-musl:class-target = "null"
