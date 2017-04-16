#! /bin/sh
. panel_colors

I_PYCHARM=
I_CHROME=
I_THUNAR=
I_RXVT=

PYCHARM="%{A:charm &:}$I_PYCHARM%{A}"
CHROME="%{A:google-chrome &:}$I_CHROME%{A}"
THUNAR="%{A:thunar &:}$I_THUNAR%{A}"
RXVT="%{A:urxvt &:}$I_RXVT%{A}"

echo "SHORTCUTS%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}$PYCHARM $CHROME $THUNAR $RXVT%{B-}%{F-}"
