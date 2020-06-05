# Usual command aliases
alias grep='grep --color=auto'
alias lsd='ls -d'
alias ll='ls -lh'

# OSX is speshul, its BSD ls doesn't even have --version,
# maybe no one installs GNU ls on it, so rely on uname -s
[[ "$(uname -s)" == "Darwin" ]] && {
        # http://osxdaily.com/2013/02/05/improve-terminal-appearance-mac-os-x/
        export LSCOLORS=ExFxBxDxCxegedabagacad
        alias ls='ls -G'
} || {
        alias ls='ls -v --color=auto --group-directories-first'
}

# Global command aliases expand in mid-execution
alias -g gp='| grep -i'
alias -g pyrg='rg -g \*py'
alias -g rsrg='rg -g \*rs'

# Files by suffix can be opened, "executed"
alias -s html=elinks
alias -s txt="less -MiN"
alias -s md="less -MiN"

# Search online real quick
alias ddg='elinks https://duckduckgo.com/'

# For zshmarks, omit p="showmarks"
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# Enforcing ripgrep-to-less could be done in config,
# but I don't track that stuff in Git. Not at the moment at least.
alias rg="rg -p"
