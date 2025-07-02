fpath=(~/.zsh ~/.zsh/zsh-completions/src $fpath)
path=($HOME/.local/bin $HOME/.zsh/bin $path /sbin /usr/sbin)

# Don't want to mess with %PATH% in Windows, except when running zsh
[ ! -z ${OS:-} ] && [ $OS = "Windows_NT" ] && {
	export PATH=$PATH:/cygdrive/c/cygwin64/bin
}

test -f ${HOME}/.dotnet/dotnet && export PATH=${HOME}/.dotnet/:${PATH}

setopt EXTENDED_GLOB
setopt autocd
setopt allexport
setopt interactivecomments

unsetopt autoremoveslash

autoload -Uz compinit
autoload -U zmv

# Completion stuff
compinit -i

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

fpath+=~/.zfunc  # wat

# Check fzy
which fzy &> /dev/null && {
        source ~/.zsh/_fzy.zsh
} || {
        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# Check brew
if type brew &> /dev/null; then
        fpath+=${HOME}/.brew/share/zsh/site-functions
        fpath+=$(brew --prefix)/share/zsh-completions
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# More variable configuration
test -f ~/.zsh/local.zsh && source ~/.zsh/local.zsh
