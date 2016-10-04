# Usual command aliases
alias grep='grep --color=auto'
alias ls='ls -v --color=auto --group-directories-first'
alias lsd='ls -d'
alias ll='ls -lh'

# Global command aliases expand in mid-execution
alias -g gp='| grep -i'

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

