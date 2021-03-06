# maybe start a GUI if one isn't running; flavour depends on which virtual terminal we are on
# we need to test that we're outside tmux, as environment variables are inherited when starting new tmux sessions
if [ "${USER}" != "root" -a -z "${TMUX}" -a -z "${DISPLAY}" -a -z "${WAYLAND_DISPLAY}" ]; then
	case "${XDG_VTNR}" in
		1)
			;&
		2)
			# according to man 5 xorg.conf an absolute directory should not be usable for a non root user
			lsmod | grep ^nvidia > /dev/null 2>&1
			if [ $? -eq 0 ]; then
				# nvidia does not allow; manually symlink .config/X11/xorg.conf.d/* to /etc/X11/xorg.conf.d
				startx >"/tmp/x.${XDG_VTNR}.${USER}.stdout" 2> "/tmp/x.${XDG_VTNR}.${USER}.stderr"
			else
				# other drivers do e.g. nouveau, i915
				startx -- -configdir "${HOME}/.config/X11/xorg.conf.d" >"/tmp/x.${XDG_VTNR}.${USER}.stdout" 2> "/tmp/x.${XDG_VTNR}.${USER}.stderr"
			fi
			;;
	esac
fi

