xinput set-prop "ASUF1208:00 2808:0218 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ASUF1208:00 2808:0218 Touchpad" "libinput Tapping Enabled" 1
xrandr --output eDP-1-1 --auto --output HDMI-0 --right-of eDP-1-1
xrdb -merge .Xresources
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi
exec i3
