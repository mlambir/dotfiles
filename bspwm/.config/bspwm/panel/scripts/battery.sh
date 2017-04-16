#! /bin/sh

. panel_colors

I_BAT_0=
I_BAT_1=
I_BAT_2=
I_BAT_3=
I_BAT_4=
I_BOLT=

BAT_LEVEL=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | sed 's/\s//g' | cut -d: -f2 | sed 's/%//')
BAT_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | sed 's/\s//g' | cut -d: -f2)
#echo 'B'$I_BAT  $BAT_LEVEL'%'

if [ "$BAT_STATE" != "discharging" ]
then
  BAT_CHARGING=" $I_BOLT"
else
  BAT_CHARGING=
fi

if [ $BAT_LEVEL -lt 20 ]
then
  OUT="$I_BAT_0 $BAT_LEVEL%$BAT_CHARGING"
elif [ $BAT_LEVEL -lt 40 ]
then
  OUT="$I_BAT_1 $BAT_LEVEL%$BAT_CHARGING"
elif [ $BAT_LEVEL -lt 60 ]
then
  OUT="$I_BAT_2 $BAT_LEVEL%$BAT_CHARGING"
elif [ $BAT_LEVEL -lt 80 ]
then
  OUT="$I_BAT_3 $BAT_LEVEL%$BAT_CHARGING"
else
  OUT="$I_BAT_4 $BAT_LEVEL%$BAT_CHARGING"
fi

echo "BATTERY%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}$OUT%{B-}%{F-}"
