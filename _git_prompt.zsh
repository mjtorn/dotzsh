# OSX compensation
[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && {
        source /usr/local/etc/bash_completion.d/git-prompt.sh
} || {
        source /usr/lib/git-core/git-sh-prompt
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

