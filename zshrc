fpath=(~/.zsh $fpath)
path=($path /sbin /usr/sbin)

# Process grep
fps() {
        ps -Af | grep $1
}

WORDCHARS=$(echo $WORDCHARS| sed -e 's/\///')  # Remove / from C-w wordseps

