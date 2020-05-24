# Process grep
function fps() {
        ps -Af | grep $1
}

# Peek into files
function peek() {
        [ ! -z ${TMUX:-} ] && {
                tmux split-window -p 33 less $@
        } || {
                less $@
        }
}

# Set the prompt with this, faster than having __git_ps1 in PROMPT
function precmd () {
        __git_ps1 "${debian_chroot:+($debian_chroot)}%n@%m:%~" "%s$ "

        test ! -z $VIRTUAL_ENV && {
                PS1="($(basename $VIRTUAL_ENV)) $PS1"
        }
}

