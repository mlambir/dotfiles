#! /bin/sh
. panel_colors

I_VOL_OFF=
I_VOL_ON=

ALSA_VOLUME=$(amixer -c 0 get Master | grep 'Mono: Playback' | grep -o '...%' | sed 's/\[//' | sed 's/%//' | sed 's/ //')
ALSA_STATE=$(amixer -c 0 get Master | grep 'Mono: Playback' | grep -o '\[on]')

if [ $ALSA_STATE ]
then
  OUT="$I_VOL_ON $ALSA_VOLUME"
else
  OUT="$I_VOL_OFF"
fi

echo "VOLUME%{F$COLOR_SYS_FG}%{B$COLOR_SYS_BG}%{A:pavucontrol &:}$OUT%{A}%{B-}%{F-}"
