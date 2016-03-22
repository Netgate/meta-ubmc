FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " file://ubmc.dts"
SRC_URI += " file://ubmc.dtsi"
SRC_URI += " file://am33xx.dtsi"
KERNEL_DEVICETREE += "ubmc.dtb"

do_kernel_configme() {
	cp "${THISDIR}/${PN}"/ubmc.* ${TMPDIR}/work-shared/beaglebone/kernel-source/arch/arm/boot/dts
}
