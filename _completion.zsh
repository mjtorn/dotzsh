zstyle ':completion:*' verbose yes

# Smart case
zstyle ':completion:*' matcher-list 'm:{a-zåäö}={A-ZÅÄÖ}'

# Closer to the bash style
zstyle ':completion:*' menu false

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

