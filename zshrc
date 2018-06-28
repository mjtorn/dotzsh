fpath=(~/.zsh ~/.zsh/zsh-completions/src $fpath)
path=($HOME/.local/bin $path /sbin /usr/sbin)

# Process grep
fps() {
        ps -Af | grep $1
}

# Set the prompt with this, faster than having __git_ps1 in PROMPT
precmd () {
        __git_ps1 "${debian_chroot:+($debian_chroot)}%n@%m:%~" "%s$ "

        test ! -z $VIRTUAL_ENV && {
                PS1="($(basename $VIRTUAL_ENV)) $PS1"
        }
}

setopt EXTENDED_GLOB
setopt autocd
setopt allexport

unsetopt autoremoveslash

autoload -U compinit
compinit

autoload -U zmv

# Love vim, but not in the shell
bindkey -e

# Sometimes... it's insane... I gotta tell you...
stty sane

# OSX or Debian, see also deprecation warning and _git for lulz
[ -f /usr/local/share/zsh/site-functions/_git ] && [ -f /usr/local/share/zsh/site-functions/git-completion.bash ] && {
        source /usr/local/share/zsh/site-functions/git-completion.bash
        autoload /usr/local/share/zsh/site-functions/_git
} || {
        source /usr/share/bash-completion/completions/git
        autoload _git
}

source ~/.zsh/zshmarks/init.zsh
source ~/.zsh/autoenv/autoenv.plugin.zsh

source ~/.zsh/_alias.zsh
source ~/.zsh/_completion.zsh
source ~/.zsh/_git_prompt.zsh
source ~/.zsh/_history.zsh
source ~/.zsh/_virtualenv.zsh

LC_COLLATE=C
REPORTTIME=10  # Report anything that lasts over 10 seconds
#RPROMPT="[zsh]"

# Remove some chars from C-w wordseps
WORDCHARS=$(echo $WORDCHARS| sed -e 's/[\/-]//')

# More variable configuration
test -f ~/.zsh/local.zsh && source ~/.zsh/local.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
