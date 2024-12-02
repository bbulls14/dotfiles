if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
  kitty-integration
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bbulls/.zshrc'



# Get ls and grep to work in color
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# ignore duplicate commands and empty lines in history
setopt HIST_IGNORE_DUPS

# java compile and run
jcar() {
trap "rm $1.class" SIGINT SIGTERM
javac $1.java
java $1
rm $1.class
}


autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship.toml

export NVM_DIR="/home/bbulls/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

