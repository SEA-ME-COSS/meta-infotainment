SUMMARY = "FTDI device driver (pure Python)"

HOMEPAGE = "http://github.com/eblot/pyftdi"
AUTHOR = "Emmanuel Blot <emmanuel.blot@free.fr>"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://setup.py;md5=b047b0ff7f3071ccd26d50135744617a"

SRC_URI = "https://files.pythonhosted.org/packages/da/db/b900789a154e32dba50f132a2a76837331801f8b521b7e1bcbb852b01a35/pyftdi-0.55.0.tar.gz"
SRC_URI[md5sum] = "fa9feda5b80db51d538ed9b98e25504e"
SRC_URI[sha256sum] = "a747bbbccc4eeea26cefa2c8bd3d2b8bef8c94ecb6969bb9c75a63640887519a"

S = "${WORKDIR}/pyftdi-0.55.0"

inherit setuptools3

DEPENDS += "python3-setuptools-scm-native"

RDEPENDS:${PN} += " \
    python3-pyusb \
    python3-pyserial \
    python3-core \
"

COMPATIBLE_HOST:libc-musl:class-target = "null"
