# precmd would fail this anyway
export VIRTUAL_ENV_DISABLE_PROMPT=yes

# OSX or Debian
[ -f /usr/local/bin/virtualenvwrapper.sh ] && {
	VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
        VIRTUALENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
} || {
        # Cygwin, Windows
        [ -f "${HOME}/../AppData/Local/Programs/Python/Python37/Scripts/virtualenvwrapper.sh" ] && {
                VIRTUALENVWRAPPER="${HOME}/../AppData/Local/Programs/Python/Python37/Scripts/virtualenvwrapper.sh"
        } || {
                VIRTUALENVWRAPPER=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
        }
}

source $VIRTUALENVWRAPPER

