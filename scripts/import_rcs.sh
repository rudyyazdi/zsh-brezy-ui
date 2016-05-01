#!/bin/sh

echo "# User configuration" > ~/.zshrc
echo "export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin" >> ~/.zshrc

case $1 in
  [Yy]* )
    echo "# Oh my zsh path and source" >> ~/.zshrc
    echo "export ZSH=~/.oh-my-zsh" >> ~/.zshrc
    echo "source \$ZSH/oh-my-zsh.sh" >> ~/.zshrc
    ;;
esac

echo "# Current plugins " >> ~/.zshrc
echo "plugins=(git brew npm bower extract z)" >> ~/.zshrc
echo "# Red dots whilst waiting for completion" >> ~/.zshrc
echo "COMPLETION_WAITING_DOTS=\"true\"" >> ~/.zshrc
echo "# History command. options: \"mm/dd/yyyy\"|\"dd.mm.yyyy\"|\"yyyy-mm-dd\"" >> ~/.zshrc
echo "HIST_STAMPS=\"dd.mm.yyyy\"" >> ~/.zshrc

case $2 in
  [Yy]* )
    echo "# PROMPT " >> ~/.zshrc
    echo "source ~/.git-prompt.sh" >> ~/.zshrc
    echo "GIT_PS1_SHOWCOLORHINTS='1'" >> ~/.zshrc
    echo "GIT_PS1_SHOWDIRTYSTATE='1'" >> ~/.zshrc
    echo "GIT_PS1_SHOWSTASHSTATE='1'" >> ~/.zshrc
    echo "GIT_PS1_SHOWUNTRACKEDFILES='1'" >> ~/.zshrc
    echo "precmd() { __git_ps1 \"%F{4}%n@%m%f %F{1}[%~]%f \" \"$ \" \"{%s} \" } " >> ~/.zshrc
    ;;
esac

echo "# Activate advanced completions" >> ~/.zshrc
echo "zstyle ':completion:*' menu select" >> ~/.zshrc

echo "# Enable colors" >> ~/.zshrc
echo "zstyle ':completion:*:default' list-colors ''" >> ~/.zshrc
echo "export CLICOLOR='1'" >> ~/.zshrc

echo "\nrun commands imported\n"
