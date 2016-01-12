fpath=(~/.zsh $fpath)
path=($path /sbin /usr/sbin)

# Process grep
fps() {
        ps -Af | grep $1
}

setopt EXTENDED_GLOB
setopt autocd
setopt allexport

WORDCHARS=$(echo $WORDCHARS| sed -e 's/\///')  # Remove / from C-w wordseps

