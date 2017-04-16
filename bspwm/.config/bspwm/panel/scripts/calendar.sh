#! /bin/sh

. panel_colors

I_CAL=

FORMAT="CALENDAR%%{F$COLOR_SYS_FG}%%{B$COLOR_SYS_BG}$I_CAL %a %D%%{B-}%%{F-}"

clock -sf "$FORMAT"
