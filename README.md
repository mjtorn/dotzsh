# https://github.com/mjtorn/dotzsh

mjt's .zsh/ stuff

## Installation

    git clone git://github.com/mjtorn/dotzsh.git .zsh

    ln -s .zsh/zshrc .zshrc

## Moar!

Add local configurations to `~/.zsh/local.zsh`, like this:

    EDITOR='/home/mjt/.local/bin/nvim'
    zstyle '*' hosts $(grep -v -e \^\# -e \^\  /etc/hosts) example.com example.org

Save a bookmark for your favorite source trees and activate Python virtualenvs automatically:

    # setup
    cd src/git_checkouts/foo
    s foo
    echo "workon foo\n" > .env
    echo "deactivate\n" > .out
    cd -

    # use
    g foo

