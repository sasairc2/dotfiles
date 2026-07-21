export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export WM="/usr/bin/wmaker"

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap
xset m 6 4
xset r rate 192 32

/usr/bin/uim-xim &
/usr/bin/pulseaudio --daemonize
/usr/local/bin/wmsystemtray &
#/usr/games/xsnow -nosanta &

exec ${WM}
