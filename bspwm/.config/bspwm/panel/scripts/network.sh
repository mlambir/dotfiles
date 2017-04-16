#! /bin/sh
. panel_colors

I_WIFI=

WIFI_SSID=$(iw wlp1s0 link | grep 'SSID' | sed 's/SSID: //' | sed 's/\t//')
WIFI_SIGNAL=$(iw wlp1s0 link | grep 'signal' | sed 's/signal: //' | sed 's/ dBm//' | sed 's/\t//')
WIFI_IP=$(ifconfig wlp1s0 | grep "inet " | cut -d' ' -f10)

OUT="$I_WIFI $WIFI_SSID($WIFI_IP)"


echo "WIFI%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}%{A:wicd-gtk &:}$OUT%{A}%{B-}%{F-}"
