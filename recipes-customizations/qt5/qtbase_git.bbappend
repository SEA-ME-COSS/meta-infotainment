SUMMARY = "Add extra Qt packages to run headunit"
 
PACKAGECONFIG:append = " \
                        eglfs \
                        fontconfig \
                        gles2 \
                        linuxfb \
                        tslib \
                        accessibility \
"

DEPENDS += "userland"

