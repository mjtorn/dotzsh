HISTFILE=${HOME}/.zhistory
HISTSIZE=2048
SAVEHIST=2048

setopt appendhistory
setopt extendedhistory
setopt histfindnodups  # not display duplicates of a line found, even if not contiguous
setopt histignorealldups
setopt histignorespace
setopt histreduceblanks  # add immediately
setopt incappendhistorytime
setopt sharehistory

