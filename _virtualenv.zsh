# precmd would fail this anyway
export VIRTUAL_ENV_DISABLE_PROMPT=yes

# This file got out of hand.
# Windows/Cygwin and virtualenvwrapper-win doesn't even work

VENVWRAPBAT="${LOCALAPPDATA}/Programs/Python/Python37/Scripts/virtualenvwrapper.bat"
[ ! -z $OS ] && [ $OS = "Windows_NT" ] && {
	[ -f $VENVWRAPBAT ] && {
		echo "Windows with virtualenvwrapper-win, not sourcing anything"
	}
} || {
	# OSX or Debian
	[ -f /usr/local/bin/virtualenvwrapper.sh ] && {
		VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
		VIRTUALENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
	} || {
		VIRTUALENVWRAPPER=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
	}

	source $VIRTUALENVWRAPPER
}

