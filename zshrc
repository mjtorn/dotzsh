fpath=(~/.zsh ~/.zsh/zsh-completions/src $fpath)
path=($HOME/.local/bin $path /sbin /usr/sbin)

# Don't want to mess with %PATH% in Windows, except when running zsh
[ ! -z ${OS:-} ] && [ $OS = "Windows_NT" ] && {
	export PATH=$PATH:/cygdrive/c/cygwin64/bin
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

source ~/.zsh/zshmarks/init.zsh
source ~/.zsh/autoenv/autoenv.plugin.zsh

source ~/.zsh/_alias.zsh
source ~/.zsh/_functions.zsh
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

which fzy &> /dev/null && {
        source ~/.zsh/_fzy.zsh
} || {
        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

fpath+=~/.zfunc
fpath+=${HOME}/.brew/share/zsh/site-functions

autoload -Uz compinit
zstyle ':completion:*' menu select
