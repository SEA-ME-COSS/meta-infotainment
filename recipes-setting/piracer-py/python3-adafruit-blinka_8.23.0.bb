SUMMARY = "CircuitPython APIs for non-CircuitPython versions of Python such as CPython on Linux and MicroPython."

HOMEPAGE = "https://github.com/adafruit/Adafruit_Blinka"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=fccd531dce4b989c05173925f0bbb76c"

SRC_URI = "git://github.com/adafruit/Adafruit_Blinka.git;branch=main;protocol=https"
SRCREV = "b50846d4207dbea6ac5dc2d22bce5c98f97092b9"

S = "${WORKDIR}/git"

inherit setuptools3

DEPENDS += "python3-setuptools-scm-native"

RDEPENDS:${PN} += " \
        libgpiod \
        python3-adafruit-platformdetect \
        python3-adafruit-pureio \
        python3-core \
"

do_install:append() {
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/bcm283x/pulseio/libgpiod_pulsein.license
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/amlogic/a311d/pulseio/libgpiod_pulsein
    rm ${D}${libdir}/python3.10/site-packages/adafruit_blinka/microcontroller/amlogic/a311d/pulseio/libgpiod_pulsein.license
}

COMPATIBLE_HOST:libc-musl:class-target = "null"
