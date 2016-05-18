
SUMMARY = "Copy any scripts to a suitable location in the ubmc image"
SECTION = "devel"
LICENSE = "GPLv2"

LIC_FILES_CHKSUM = \
"file://${WORKDIR}/LICENSE;beginline=1;endline=2;md5=ffa9c48c733258b56703d7ea15a6a0cd"
SRC_URI = "file://ubmc-test.sh"
# SRC_URI = "file://LICENSE"

FILES_${PN} = ""
ALLOW_EMPTY_${PN} = "1"

# Copy script to the deploy area with u-boot, uImage, and rootfs
do_deploy () {
   install -d ${DEPLOY_DIR_IMAGE}
   install -m 0755 ${WORKDIR}/ubmc-test.sh ${DEPLOY_DIR_IMAGE}
}
addtask deploy after do_install