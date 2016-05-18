#!/bin/sh

# Provides a method of testing hte micro-BMC board including:
#   gpioThermal sensors
#   Bus voltage monitors
#   Fan control

PERIOD=40000
DUTY=20000

read_pin() {
   PIN=$1
   echo $PIN >/sys/class/gpio/unexport >/dev/null 2>&1
   echo $PIN >/sys/class/gpio/export
   echo "in" >> /sys/class/gpio/gpio$PIN/direction
   cat /sys/class/gpio/gpio$PIN/value
   echo $PIN >/sys/class/gpio/unexport
}

read_adc() {
   let D=`cat /sys/bus/iio/devices/iio\:device0/in_voltage$1_raw`
   let "D=$D * 1800"
   let "V=$D/4095"
   echo $V mV
}

function showvoltage() {
echo ---- Voltage monitors ------

for VM in {0..7} ; do
   echo -n "Monitor $VM      : "; read_adc $VM;
done
}

function showtemp() {
echo ---- Temperture sensor ----
echo -n "Temperature:   : "; echo $(lm76);
echo
}

function showtitle() {
   echo -e "Netgate micro-BMC test utility\n"
}

function showgpio () {
echo ---- GPIO -------------------
echo -n "PLTRST_N       : "; read_pin 86;
echo -n "PSU_PWRGD_3    : "; read_pin 19;
echo -n "PSU_PWRGD_2    : "; read_pin 117;
echo -n "PSU_PWRGD_1    : "; read_pin 110;
echo -n "PSU_PWRGD-0    : "; read_pin 114;
echo -n "PROCHOT_N      : "; read_pin 92;
echo -n "THERMTRIP_N    : "; read_pin 30;
echo -n "ERROR_N        : "; read_pin 67;
echo -n "S3_N           : "; read_pin 66;
echo -n "S4_N           : "; read_pin 87;
echo -n "S5_N           : "; read_pin 69;
echo -n "HEARTBEAT_DIS  : "; read_pin 7;
echo
}

function showmenu () {
   echo -e "\t1)\tDisplay GPIO state"
   echo -e "\t2)\tDisplay current host temperature"
   echo -e "\t3)\tDisplay bus voltages"
   echo -e "\t4)\tSet fan speed"
   echo -e "\t5)\tShow fan RPM"
   echo -e "\tQ)\tQuit"
   echo
}

function setfan () {

   if [ $2 -gt 5 ] ; then
      echo "fan speed must be between 0 and 5"
      return
   fi

   case $1 in
      "0")
         FAN=1
      ;;

      "1")
         FAN=4
      ;;
   esac

   echo "Setting fan $1 to speed $2"
   echo

   let DUTY="$2*5000"
   let DUTY="35000-$DUTY"

   echo  0 > /sys/class/pwm/pwmchip$FAN/unexport
   echo  0 > /sys/class/pwm/pwmchip$FAN/export
   sleep 1
   echo  $PERIOD > /sys/class/pwm/pwmchip$FAN/pwm0/period
   echo  $DUTY  > /sys/class/pwm/pwmchip$FAN/pwm0/duty_cycle
   echo  1 > /sys/class/pwm/pwmchip$FAN/pwm0/enable
}

reset
showtitle
showmenu

while ( true ) ; do
   read -p "      Choice : " C

   case $C in
      "1")
         reset
         showtitle
         showgpio
      ;;

      "2")
         reset
         showtitle
         showtemp
      ;;

      "3")
         reset
         showtitle
         showvoltage
      ;;

      "4")
         read -p "      Fan 0 or Fan 1?  : " F
         read -p "      Speed [ 0 .. 5]  : " S

         reset
         showtitle

         setfan $F $S
      ;;

      "5")
         reset
         showtitle
         echo "Feature not yet implemented. Sorry :("
         echo
      ;;

      "q")
        exit 0
       ;;

      "Q")
         exit 0
       ;;
   esac

   showmenu
done