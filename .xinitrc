export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export WM="/usr/bin/wmaker"

#xrandr --auto
#xrandr --newmode "2560x1440_60.00" 312.25 2560 2752 3024 3488 1440 1443 1448 1493 -hsync +vsync
#xrandr --addmode HDMI-2 "2560x1440_60.00"
#xrandr --output HDMI-2 --mode "2560x1440" --right-of eDP-1

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
xset r rate 192 32

xinput set-prop 'PS/2 Synaptics TouchPad' 'libinput Accel Speed' 1
xinput set-prop 'Kensington Expert Mouse" "libinput Accel Speed' -0.2
xinput set-prop 'SINO WEALTH ELECOM TrackBall Mouse' 'libinput Accel Speed' -0.75

/usr/bin/uim-xim &
/usr/bin/pulseaudio --daemonize
/usr/local/bin/wmsystemtray &
/usr/local/bin/wmbatteries &
/usr/bin/pavucontrol &
#LANG=C /usr/bin/gkrellm &
#/usr/games/xsnow -nosanta &

exec "${WM}"
