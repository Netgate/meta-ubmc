/*
 * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

/ {
	memory {
		device_type = "memory";
		reg = <0x80000000 0x10000000>; /* 256 MB */
	};

	vmmcsd_fixed: fixedregulator@0 {
		compatible = "regulator-fixed";
		regulator-name = "vmmcsd_fixed";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;
	};
};

&am33xx_pinmux {
	pinctrl-names = "default";
	pinctrl-0 = <&clkout2_pin>;

	/* eHRPWM0 module */
	pinctrl_ehrpwm0: pinctrl_ehrpwm0 {
	    pinctrl-single,pins = <
	        0x150 0x23  /* P9_22 = GPIO0_2 = eHRPWM0A, MODE3 */
	        0x190 0x21  /* P9_31 = GPIO3_14 = eHRPWM0A, MODE1 */
	        0x154 0x23  /* P9_21 = GPIO0_3 = eHRPWM0B, MODE3 */
	        /*0x0a4 0x23     This is not OK P8_46 = GPIO2_7 = eHRPWM0B, MODE3 */
	    >;
	};

	/* eCAP0 module ?????*/
	pinctrl_ecap0: pinctrl_ecap0 {
	    pinctrl-single,pins = <
	        0x164 0x20  /* P9_42A (?) = GPIO0_7 = eCAP0, MODE0 */
	    >;
	};

	/* eQEP0 module */
	pinctrl_eqep0: pinctrl_eqep0 {
	    pinctrl-single,pins = <
	        0x1a8 0x21  /* P9_41B = GPIO3_20 = eQEP0_index, MODE1 */
	        0x1ac 0x21  /* P9_25 = GPIO3_21 = eQEP0_strobe, MODE1 */
	        0x1a4 0x31  /* P9_27 = GPIO3_19 = eQEP0B_in, MODE1 */
	        0x1a0 0x31  /* P9_42B = GPIO3_18 = eQEP0A_in, MODE1 */
	    >;
	};


	/* eHRPWM1 module */
	pinctrl_ehrpwm1: pinctrl_ehrpwm1 {
	    pinctrl-single,pins = <
	        0x048 0x26  /* P9_14 = GPIO1_18 = eHRPWM1A, MODE6 */
	        0x0c8 0x22  /* P8_36 = GPIO2_16 = eHRPWM1A, MODE2 */
	        0x04c 0x26  /* P9_16 = GPIO1_19 = eHRPWM1B, MODE6 */
	        0x0cc 0x22  /* P8_34 = GPIO2_17 = eHRPWM1B, MODE2 */
	    >;
	};

	/* eQEP1 module */
	pinctrl_eqep1: pinctrl_eqep1 {
	    pinctrl-single,pins = <
	        /*0x0d8 0x22     P8_31 = GPIO0_10 = eQEP1_index, MODE2, USED FOR PHOTOCELLS */
	        /*0x0dc 0x22     P8_32 = GPIO0_11 = eQEP1_strobe, MODE2 USED FOR PHOTOCELLS */
	        0x0d4 0x32  /* P8_33 = GPIO0_09 = eQEP1B_in, MODE2 */
	        0x0d0 0x32  /* P8_35 = GPIO0_08 = eQEP1A_in, MODE2 */
	    >;
	};


	/* eHRPWM2 module */
	pinctrl_ehrpwm2: pinctrl_ehrpwm2 {
	    pinctrl-single,pins = <
	        0x020 0x24  /* P8_19 = GPIO0_22 = eHRPWM2A, MODE4*/
	        0x0a0 0x23  /* P8_45 = GPIO2_6 = eHRPWM2A, MODE3 */
	        0x024 0x24  /* P8_13 = GPIO0_23 = eHRPWM2B, MODE4 */
	        0x0a4 0x23  /* P8_46 = GPIO2_7 = eHRPWM2B, MODE3 */
	    >;
	};

	/* eCAP2 module */
	pinctrl_ecap2: pinctrl_ecap2 {
	    pinctrl-single,pins = <
	        0x19c 0x24  /* P9_28 = GPIO3_17 = eCAP2, MODE4 */
	    >;
	};

	/* eQEP2 module */
	pinctrl_eqep2: pinctrl_eqep2 {
	    pinctrl-single,pins = <
	        0x038 0x0F  /* P8_16 = GPIO1_14 = eQEP2_index, MODE4 --- STOLEN FOR MOTOR DIRECTION, ORIGINAL HEX value was 0x24*/
	        0x03c 0x0F  /* P8_15 = GPIO1_15 = eQEP2_strobe, MODE4 --- STOLEN FOR MOTOR DIRECTION, ORIGINAL HEX value was 0x24*/
	        0x034 0x34  /* P8_11 = GPIO1_13 = eQEP2B_in, MODE4 */
	        0x030 0x34  /* P8_12 = GPIO1_12 = eQEP2A_in, MODE4 */
	    >;
	};
	
	i2c0_pins: pinmux_i2c0_pins {
		pinctrl-single,pins = <
			AM33XX_IOPAD(0x988, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c0_sda.i2c0_sda */
			AM33XX_IOPAD(0x98c, PIN_INPUT_PULLUP | MUX_MODE0)	/* i2c0_scl.i2c0_scl */
		>;
	};

	uart0_pins: pinmux_uart0_pins {
		pinctrl-single,pins = <
			AM33XX_IOPAD(0x970, PIN_INPUT_PULLUP | MUX_MODE0)	/* uart0_rxd.uart0_rxd */
			AM33XX_IOPAD(0x974, PIN_OUTPUT_PULLDOWN | MUX_MODE0)	/* uart0_txd.uart0_txd */
		>;
	};

	clkout2_pin: pinmux_clkout2_pin {
		pinctrl-single,pins = <
			AM33XX_IOPAD(0x9b4, PIN_OUTPUT_PULLDOWN | MUX_MODE3)	/* xdma_event_intr1.clkout2 */
		>;
	};

	cpsw_default: cpsw_default {
		pinctrl-single,pins = <
			/* Slave 1 */
			AM33XX_IOPAD(0x914, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txen.rgmii_1_txen */
			AM33XX_IOPAD(0x918, PIN_INPUT_PULLUP | MUX_MODE2)	/* mii1_rxdv.rgmii_1_rxdv */
			AM33XX_IOPAD(0x91c, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txd3.rgmii_1_txd3 */
			AM33XX_IOPAD(0x920, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txd2.rgmii_1_txd2 */
			AM33XX_IOPAD(0x924, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txd1.rgmii_1_txd1 */
			AM33XX_IOPAD(0x928, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txd0.rgmii_1_txd0 */
			AM33XX_IOPAD(0x92c, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* mii1_txclk.rgmii_1_txclk */
			AM33XX_IOPAD(0x930, PIN_INPUT_PULLUP | MUX_MODE2)	/* mii1_rxclk.rgmii_1_rxclk */
			AM33XX_IOPAD(0x934, PIN_INPUT_PULLUP | MUX_MODE2)	/* mii1_rxd3.rgmii_1_rxd3 */
			AM33XX_IOPAD(0x938, PIN_INPUT_PULLUP | MUX_MODE2)	/* mii1_rxd2.rgmii_1_rxd2 */
			AM33XX_IOPAD(0x93c, PIN_INPUT_PULLUP | MUX_MODE2)	/* mii1_rxd1.rgmii_1_rxd1 */
			AM33XX_IOPAD(0x940, PIN_INPUT_PULLUP | MUX_MODE2)	/* mii1_rxd0.rgmii_1_rxd0 */

			/* Slave 2 */
			AM33XX_IOPAD(0x840, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* gmpc_a0.rgmii_2_txen */
			AM33XX_IOPAD(0x844, PIN_INPUT_PULLUP | MUX_MODE2)	/* gmpc_a1.rgmii_2_rxdv */
			AM33XX_IOPAD(0x848, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* gmpc_a2.rgmii_2_txd3 */
			AM33XX_IOPAD(0x84c, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* gmpc_a3.rgmii_2_txd2 */
			AM33XX_IOPAD(0x850, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* gmpc_a4.rgmii_2_txd1 */
			AM33XX_IOPAD(0x854, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* gmpc_a5.rgmii_2_txd0 */
			AM33XX_IOPAD(0x858, PIN_OUTPUT_PULLDOWN | MUX_MODE2)	/* gmpc_a6.rgmii_2_txclk */
			AM33XX_IOPAD(0x85c, PIN_INPUT_PULLUP | MUX_MODE2)	/* gmpc_a7.rgmii_2_rxclk */
			AM33XX_IOPAD(0x860, PIN_INPUT_PULLUP | MUX_MODE2)	/* gmpc_a8.rgmii_2_rxd3 */
			AM33XX_IOPAD(0x864, PIN_INPUT_PULLUP | MUX_MODE2)	/* gmpc_a9.rgmii_2_rxd2 */
			AM33XX_IOPAD(0x868, PIN_INPUT_PULLUP | MUX_MODE2)	/* gmpc_a10.rgmii_2_rxd1 */
			AM33XX_IOPAD(0x86c, PIN_INPUT_PULLUP | MUX_MODE2)	/* gmpc_a11.rgmii_2_rxd0 */
		>;
	};

	cpsw_sleep: cpsw_sleep {
		pinctrl-single,pins = <
			/* Slave 1 reset value */
			AM33XX_IOPAD(0x914, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x918, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x91c, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x920, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x924, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x928, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x92c, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x930, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x934, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x938, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x93c, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x940, PIN_INPUT_PULLDOWN | MUX_MODE7)

			/* Slave 2 reset value */
			AM33XX_IOPAD(0x840, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x844, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x848, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x84c, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x850, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x854, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x858, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x85c, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x860, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x864, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x868, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x86c, PIN_INPUT_PULLDOWN | MUX_MODE7)
		>;
	};

	davinci_mdio_default: davinci_mdio_default {
		pinctrl-single,pins = <
			/* MDIO */
			AM33XX_IOPAD(0x948, PIN_INPUT_PULLUP | SLEWCTRL_FAST | MUX_MODE0)	/* mdio_data.mdio_data */
			AM33XX_IOPAD(0x94c, PIN_OUTPUT_PULLUP | MUX_MODE0)			/* mdio_clk.mdio_clk */
		>;
	};

	davinci_mdio_sleep: davinci_mdio_sleep {
		pinctrl-single,pins = <
			/* MDIO reset value */
			AM33XX_IOPAD(0x948, PIN_INPUT_PULLDOWN | MUX_MODE7)
			AM33XX_IOPAD(0x94c, PIN_INPUT_PULLDOWN | MUX_MODE7)
		>;
	};

	mmc1_pins: pinmux_mmc1_pins {
		pinctrl-single,pins = <
			AM33XX_IOPAD(0x960, PIN_INPUT | MUX_MODE7) /* GPIO0_6 */
		>;
	};

	emmc_pins: pinmux_emmc_pins {
		pinctrl-single,pins = <
			AM33XX_IOPAD(0x880, PIN_INPUT_PULLUP | MUX_MODE2) /* gpmc_csn1.mmc1_clk */
			AM33XX_IOPAD(0x884, PIN_INPUT_PULLUP | MUX_MODE2) /* gpmc_csn2.mmc1_cmd */
			AM33XX_IOPAD(0x800, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad0.mmc1_dat0 */
			AM33XX_IOPAD(0x804, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad1.mmc1_dat1 */
			AM33XX_IOPAD(0x808, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad2.mmc1_dat2 */
			AM33XX_IOPAD(0x80c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad3.mmc1_dat3 */
			AM33XX_IOPAD(0x810, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad4.mmc1_dat4 */
			AM33XX_IOPAD(0x814, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad5.mmc1_dat5 */
			AM33XX_IOPAD(0x818, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad6.mmc1_dat6 */
			AM33XX_IOPAD(0x81c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_ad7.mmc1_dat7 */
		>;
	};
};

&uart0 {
	pinctrl-names = "default";
	pinctrl-0 = <&uart0_pins>;

	status = "okay";
};

&usb {
	status = "okay";
};

&usb_ctrl_mod {
	status = "okay";
};

&usb0_phy {
	status = "okay";
};

&usb1_phy {
	status = "okay";
};

&usb0 {
	status = "okay";
	dr_mode = "host";
};

&usb1 {
	status = "okay";
	dr_mode = "host";
};

&cppi41dma  {
	status = "okay";
};

&i2c0 {
	pinctrl-names = "default";
	pinctrl-0 = <&i2c0_pins>;

	status = "okay";
	clock-frequency = <400000>;

	baseboard_eeprom: baseboard_eeprom@50 {
		compatible = "atmel,24c256";
		reg = <0x50>;

		#address-cells = <1>;
		#size-cells = <1>;
		baseboard_data: baseboard_data@0 {
			reg = <0 0x100>;
		};
	};
};

&tscadc {
	status = "okay";

	adc {
		#io-channel-cells = <0x1>;
		compatible = "ti,am3359-adc";
		ti,adc-channels = <0x00 0x01 0x02 0x03 0x4 0x5 0x6 0x7>;
	};
};

&cpsw_emac0 {
	phy_id = <&davinci_mdio>, <1>;
	phy-mode = "rgmii";
	dual_emac_res_vlan = <1>;
};

&cpsw_emac1 {
	phy_id = <&davinci_mdio>, <2>;
	phy-mode = "rgmii";
	dual_emac_res_vlan = <2>;
};

&mac {
	pinctrl-names = "default", "sleep";
	pinctrl-0 = <&cpsw_default>;
	pinctrl-1 = <&cpsw_sleep>;
	active_slave = <1>;
	status = "okay";
	dual_emac;
	txen-skew-ps = <3>;
	rxdv-skew-ps = <7>;
	rxd0-skew-ps = <7>;
	rxd1-skew-ps = <7>;
	rxd2-skew-ps = <7>;
	rxd3-skew-ps = <7>;
	txd0-skew-ps = <3>;
	txd1-skew-ps = <3>;
	txd2-skew-ps = <3>;
	txd3-skew-ps = <3>;
	rxc-skew-ps = <0x1f>;
	txc-skew-ps = <0xf>;
};

&davinci_mdio {
	pinctrl-names = "default", "sleep";
	pinctrl-0 = <&davinci_mdio_default>;
	pinctrl-1 = <&davinci_mdio_sleep>;
	status = "okay";
};

&aes {
	status = "okay";
};

&sham {
	status = "okay";
};
