fpath=(~/.zsh $fpath)
path=($path /sbin /usr/sbin)

# Process grep
fps() {
        ps -Af | grep $1
}

setopt EXTENDED_GLOB
setopt autocd
setopt allexport

autoload -U compinit
compinit

HISTSIZE=2048
LC_COLLATE=C
REPORTTIME=10  # Report anything that lasts over 10 seconds
#RPROMPT="[zsh]"
WORDCHARS=$(echo $WORDCHARS| sed -e 's/\///')  # Remove / from C-w wordseps

