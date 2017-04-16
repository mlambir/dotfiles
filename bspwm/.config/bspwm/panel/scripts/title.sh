#! /bin/sh

. panel_colors

FORMAT="TITLE%%{F$COLOR_TITLE_FG}%%{B$COLOR_TITLE_BG}%s\n{B-}%%{F-}"

xtitle -t 128 -sf "$FORMAT"
