ubmc.dts and ubmc.dtsi configure the uBMC pins and peripherals. 

USB 0 & 1 Enabled in host mode
ADC conver 8 channels enabled
eth0 and eth1 enbled
MMC enabled
I2C enabled

The file am33xx.dtsi is used for development, but is not included in the recipe. If you want to use it for testing andd it to the bbappend file and copy it to the same place the ubmc.dts* files go
