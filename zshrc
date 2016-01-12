fpath=(~/.zsh $fpath)
path=($path /sbin /usr/sbin)

# Process grep
fps() {
        ps -Af | grep $1
}

# Set the prompt with this, faster than having __git_ps1 in PROMPT
precmd () {
        __git_ps1 "${debian_chroot:+($debian_chroot)}%n@%m:%~" "%s$ "
}

setopt EXTENDED_GLOB
setopt autocd
setopt allexport

autoload -U compinit
compinit

# XXX: Debian-specific, see also deprecation warning and _git for lulz
source /usr/share/bash-completion/completions/git
autoload _git

source ~/.zsh/_alias.zsh
source ~/.zsh/_completion.zsh
source ~/.zsh/_git_prompt.zsh

HISTSIZE=2048
LC_COLLATE=C
REPORTTIME=10  # Report anything that lasts over 10 seconds
#RPROMPT="[zsh]"
WORDCHARS=$(echo $WORDCHARS| sed -e 's/\///')  # Remove / from C-w wordseps

