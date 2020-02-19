# timkl zsh config

export ZSH="/home/timkl/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uupdate zsh
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=3

COMPLETION_WAITING_DOTS="true"

# History
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# vi mode 
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# lf
LFCD=$GOPATH/src/github.com/gokcehan/lf/etc/lfcd.sh  # source
LFCD=~/.config/lf/lfcd.sh                            # pre-built binary
if [ -f $LFCD ]; then
  source $LFCD
fi
bindkey -s '^o' 'lfcd\n'  # zsh

# Change cursor shape for different  vi modes

function zle-keymap-select {
	  if [[ ${KEYMAP} == vicmd ]] ||
		       [[ $1 = 'block' ]]; then
	      echo -ne '\e[1 q'
	        elif [[ ${KEYMAP} == main ]] ||
			       [[ ${KEYMAP} == viins ]] ||
			              [[ ${KEYMAP} = '' ]] ||
				             [[ $1 = 'beam' ]]; then
		    echo -ne '\e[5 q'
		      fi
	      }
	      zle -N zle-keymap-select
	      zle-line-init() {
	          zle -K viins 
		      echo -ne "\e[5 q"
	      }
	      zle -N zle-line-init
	      echo -ne '\e[5 q' 
	      preexec() { echo -ne '\e[5 q' ;}

# History
alias c="clear"
alias ll="ls -a"
alias zs="source ~/.zshrc"
alias zc="vim  ~/.zshrc"
alias vs="source ~/.vimrc"
alias vc="vim ~/.vimrc"
alias vpn-dk="sudo openvpn /etc/openvpn/expressvpn/my_expressvpn_denmark_udp.ovpn"

