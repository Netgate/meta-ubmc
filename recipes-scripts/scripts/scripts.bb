
SUMMARY = "Copy any scripts to a suitable location in the ubmc image"
SECTION = "devel"
LICENSE = "GPLv2"

LIC_FILES_CHKSUM = \
"file://${WORKDIR}/LICENSE;beginline=1;endline=2;md5=ffa9c48c733258b56703d7ea15a6a0cd"
SRC_URI = "file://ubmc-test.sh"
SRC_URI = "file://LICENSE"

FILES_${PN} = "/usr/bin/*.sh"


# Copy script to the deploy area with u-boot, uImage, and rootfs
do_install () {
	install -d ${D}/usr
	install -d ${D}/usr/bin
	install -m 0755 ${WORKDIR}/*.sh ${D}/usr/bin
}
