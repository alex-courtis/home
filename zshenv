path=(~/bin $path)

# vi everywhere, symlinked to vim
export EDITOR="vi"
export VISUAL="vi"

# better paging
export PAGER="less"

# case insensitive searching, raw escape sequence passthrough, skip single screen
export LESS=iRF

# tell old java apps that we're using a non-reparenting window manager
export _JAVA_AWT_WM_NONREPARENTING=1

# some java build systems seem to like having JAVA_HOME set
if [ -L /usr/lib/jvm/default ]; then
	export JAVA_HOME=/usr/lib/jvm/default
fi

# allow use of "dev version" libraries under /usr/local/lib
export LD_LIBRARY_PATH="/usr/local/lib"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

# unfortunately some apps need extra encouragement to follow the XDG base directory spec
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# keep this synced with 90-keyboard.conf, until X goes away
export XKB_DEFAULT_LAYOUT="us"
export XKB_DEFAULT_MODEL="pc105"
export XKB_DEFAULT_VARIANT="dvp"
export XKB_DEFAULT_OPTIONS="caps:backspace"

# don't minimise fullscreen SDL (i.e. most steam) when losing focus
# they send a _NET_WM_STATE_FULLSCREEN _NET_WM_STATE_REMOVE however never send an ADD message on regaining focus
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

# moar history
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# shell and tmux colours
COL_ZSH_OFF="%k%f"
COL_ZSH_WAR="%F{black}%K{yellow}"
COL_ZSH_ERR="%F{black}%K{red}"
if [ "${USER}" = "root" ]; then
	COL_ZSH_NOR="%F{black}%K{red}"
	export COL_TMUX_NORM="fg=black,bg=red"
elif [ -n "${SSH_CONNECTION}" ]; then
	COL_ZSH_NOR="%F{black}%K{magenta}"
	export COL_TMUX_NORM="fg=black,bg=magenta"
else
	COL_ZSH_NOR="%F{black}%K{green}"
	export COL_TMUX_NORM="fg=black,bg=green"
fi

case "${HOST}" in
	tinygod)
		export MAKEFLAGS="-j64"
		;;
	emperor)
		export MAKEFLAGS="-j32"
		;;
	*)
		export MAKEFLAGS="-j8"
		;;
esac

