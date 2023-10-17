IMAGE_BASE = " \
    python3 \
    python3-numpy \
    bash \
    openssh \
    wpa-supplicant \
    git \
    can-utils \
    libsocketcan \
    bcm2835-dev \
"

EX_CODE = " \
    can-example \
    helloworld-example \
    qt5-simple-example \
    vsomeip-example \
"

VSOMEIP_PKGS = " \
    common-api-c++ \
    common-api-c++-dev \
    vsomeip \
    vsomeip-dev \
    common-api-c++-someip \
    common-api-c++-someip-dev \
"

HU_CODE = " \
    headunit \
    auto-start \
"

QT_BASE = " \
    qtbase \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-plugins \
    qtbase-tools \
"
 
QT_PKGS = " \
    qt3d \
    qt3d-dev \
    qt3d-mkspecs \
    qtcharts \
    qtcharts-dev \
    qtcharts-mkspecs \
    qtconnectivity-dev \
    qtconnectivity-mkspecs \
    qtquickcontrols2 \
    qtquickcontrols2-dev \
    qtquickcontrols2-mkspecs \
    qtdeclarative \
    qtdeclarative-dev \
    qtdeclarative-mkspecs \
    qtgraphicaleffects \
    qtgraphicaleffects-dev \
    qtquickcontrols \
    qtquickcontrols-dev \
    qtquickcontrols-mkspecs \
    qtquickcontrols2 \
    qtmultimedia \
"

PIRACER_PKGS = " \
    python3-adafruit-blinka \
    python3-adafruit-circuitpython-busdevice \
    python3-adafruit-circuitpython-pca9685 \
    python3-adafruit-circuitpython-register \
    python3-adafruit-platformdetect \
    python3-adafruit-pureio \
    python3-pyserial \
    python3-pyusb \
    rpi-gpio \
    python3-typing-extensions \
    python3-wheel \
    python3-adafruit-circuitpython-framebuf \
    python3-adafruit-circuitpython-ina219 \
    python3-adafruit-circuitpython-ssd1306 \
    python3-adafruit-circuitpython-typing \
    python3-adafruit-circuitpython-requests \
    python3-pyftdi \
    python3-piracer-py \
"

IMAGE_INSTALL += " \
    ${IMAGE_BASE} \
    ${QT_BASE} \
    ${QT_PKGS} \
    ${PIRACER_PKGS} \
    ${HU_CODE} \
    ${VSOMEIP_PKGS} \
"

