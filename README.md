# https://github.com/mjtorn/dotzsh

mjt's .zsh/ stuff

## Installation

    git clone git://github.com/mjtorn/dotzsh.git .zsh --recurse-submodules

    ln -s .zsh/zshrc .zshrc
    ln -s .zsh/zshenv .zshenv

## OSX

Didn't bother too much with keeping track of actual dependencies, but the following should be helpful
through `brew install`:

  * bash-completion
  * fzf
  * git
  * pyenv
  * pyenv-virtualenvwrapper
  * python

Virtualenvwrapper was installed like `/usr/local/Cellar/pyenv-virtualenvwrapper/20140609/bin/pyenv-sh-virtualenvwrapper`.

## Moar!

Add local configurations to `~/.zsh/local.zsh`, like this:

    EDITOR='/home/mjt/.local/bin/nvim'
    zstyle '*' hosts $(grep -v -e \^\# -e \^\  /etc/hosts) example.com example.org

Save a bookmark for your favorite source trees and activate Python virtualenvs automatically:

    # setup
    cd src/git_checkouts/foo
    s foo
    echo "workon foo\n" > .env
    cat > .out <<EOF
    if [ -n "\${VIRTUAL_ENV:-}" ]; then
        deactivate
    fi
    EOF
    cd -

    # use
    g foo

