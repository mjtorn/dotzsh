zstyle ':completion:*' verbose yes

# Smart case
zstyle ':completion:*' matcher-list 'm:{a-zåäö}={A-ZÅÄÖ}'

zstyle ':completion:*' menu select

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

