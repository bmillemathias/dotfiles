# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH="$HOME/.local/bin":$HOME/bin:$PATH
export PATH

# User specific aliases and functions
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

urldecode(){ local d=${1//+/ }; printf '%b' "${d//%/\x}"; }
