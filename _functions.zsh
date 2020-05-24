# Pretty rg always goes to `less`
# and also support `-G` for `! -g`
# https://github.com/ssokolow/profile/blob/1173573ad6cf615459b942bc49f78e2ea60ef365/home/.zshrc.d/rg
function rg() {
    declare -a OUTPUT
    local USE_PAGER

    # -- Support an .ackrc-like .rgrc file --
    # Blank lines and lines beginning with # are ignored
    # All other lines are parsed together as if they ended with \
    # and prepended onto $@ before calling rg.
    CFG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/rgrc"
    if [ -f "$CFG_PATH" ]; then
        # Source: http://stackoverflow.com/a/10929511/435253
        while read -r line || [[ -n "$line" ]]; do
            if [ "$line" = "" ] || [[ "$line" == '#'* ]]; then
                continue
            fi

            # Source: http://stackoverflow.com/a/31485948/435253
            while IFS= read -r -d ''; do
                OUTPUT+=( "$REPLY" )
                if [[ "$REPLY" = "-p"* ]]; then
                    USE_PAGER=1
                fi
            done < <(xargs printf '%s\0' <<<"$line")
        done < "$CFG_PATH"
    fi

    # -- Implement `-G ...` as an alternative to `-g !...` --
    # Work around a footgun in zsh's handling of ! characters
    for ARG in "$@"; do
        if [[ "$ARG" = "-p" ]]; then
            USE_PAGER=1
        fi

        if [[ "$ARG" = "-G"* ]]; then
            OUTPUT+=( "-g" )
            if [ "$ARG" = "-G" ]; then
                take_next=1
            else
                OUTPUT+=( "!${ARG:2}" )
            fi
        elif [ "$take_next" = 1 ]; then
            OUTPUT+=( "!$ARG" )
            unset take_next
        else
            OUTPUT+=( "$ARG" )
        fi
    done

    if [ "$USE_PAGER" = 1 ]; then
        command rg "${OUTPUT[@]}" | less -RFX
    else
        command rg "${OUTPUT[@]}"
    fi
}

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

