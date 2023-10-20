DESCRIPTION = "QT simple application"

LICENSE = "CLOSED"

inherit qmake5
          
SRC_URI += " \
            file://simple.pro \
            file://qml.qrc \
            file://main.cpp \
            file://main.qml \
            file://MainForm.ui.qml \
            file://deployment.pri \
"
    
S = "${WORKDIR}"

DEPENDS = " \
            qtbase \
            qtquickcontrols2 \
"

do_configure() { 
    qmake ${S}/simple.pro
}
    
do_install(){
    install -d ${D}${bindir}/example/qt5-example
    install -m 0755 simple ${D}${bindir}/example/qt5-example
}
