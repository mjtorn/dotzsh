source ~/.zsh/zsh-fzy/zsh-fzy.plugin.zsh

## "Typical configuration"
## https://github.com/aperezdc/zsh-fzy
#
# ALT-C: cd into the selected directory
# CTRL-T: Place the selected file path in the command line
# CTRL-R: Place the selected command from history in the command line
# CTRL-P: Place the selected process ID in the command line
bindkey '\ec' fzy-cd-widget
bindkey '^T'  fzy-file-widget
bindkey '^R'  fzy-history-widget
bindkey '^P'  fzy-proc-widget

# fzf also has 12 lines, at least mine had, seems good
zstyle :fzy:history lines '12'

