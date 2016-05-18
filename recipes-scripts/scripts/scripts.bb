
SUMMARY = "Copy any scripts to a suitable location in the ubmc image"
SECTION = "devel"
LICENSE = "GPLv2"

LIC_FILES_CHKSUM = \
"file://${WORKDIR}/LICENSE;beginline=1;endline=2;md5=ffa9c48c733258b56703d7ea15a6a0cd"

SRC_URI = "file://ubmc-test.sh \
		   file://LICENSE"

FILES_${PN} = "/usr/bin/ubmc-test.sh"
ALLOW_EMPTY_${PN} = "1"

S = "${WORKDIR}"

do_install () {
    install -d ${D}/usr/bin/ubmc-test.sh
}

