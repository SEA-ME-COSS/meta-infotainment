PDC_CODE = " \
    pdc \
    supervisor \
"

IMAGE_BASE = " \
    python3 \
    python3-numpy \
    bash \
    wpa-supplicant \
    openssh \
    git \
    can-utils \
    libsocketcan \
    bcm2835-dev \
    python3-supervisor \
"

VSOMEIP_PKGS = " \
    common-api-c++ \
    common-api-c++-dev \
    vsomeip \
    vsomeip-dev \
    common-api-c++-someip \
    common-api-c++-someip-dev \
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
    qtwayland \
"

GSTREAMER_PKGS = " \
    gst-devtools \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-libav \
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
    opencv \    
"

IMAGE_INSTALL += " \
    ${IMAGE_BASE} \
    ${PIRACER_PKGS} \
    ${PDC_CODE} \
    ${QT_PKGS} \
    ${QT_BASE} \
    ${VSOMEIP_PKGS} \
    ${GSTREAMER_PKGS} \
"

