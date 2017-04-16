#! /bin/sh

. panel_colors

I_CLOCK=

FORMAT="CLOCK%%{F$COLOR_SYS_FG}%%{B$COLOR_SYS_BG}$I_CLOCK %H:%M%{B-}%%{F-}"

clock -sf "$FORMAT"
