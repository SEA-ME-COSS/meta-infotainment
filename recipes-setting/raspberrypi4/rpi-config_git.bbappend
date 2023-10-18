# ISSUE : Setting for i2c & dtoverlay is not working in rpi-config_git.bb. 
#         So you should do theses setting in local.conf

do_deploy:append() {
    echo "# Turn on spi">> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtparam=spi=on" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    
    echo "# Setting for 2-CH FD CAN Hat" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=spil-3cs" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=mcp251xfd,spi0-0,interrupt=25" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "dtoverlay=mcp251xfd,spi1-0,interrupt=24" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    
    echo "# Setting for 7Inch HDMI LCD(H)" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_force_hotpulg=1" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "config_hdmi_boost=10" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_group=2" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_mode=87" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    echo "hdmi_cvt 1024 1280 60 6 0 0 0" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
}
