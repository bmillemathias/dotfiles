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

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then                                     
    GIT_PROMPT_ONLY_IN_REPO=1                                                             
    source $HOME/.bash-git-prompt/gitprompt.sh                                            
fi                                                                                        

export EDITOR=vim
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
                                                                                          
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in                                                                      
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;                          
    *)            fzf "$@" ;;                                                             
  esac                                                                                    
}                                                                                         

eval $(thefuck --alias)

# display a random man page when a shell starts
text=$(man $(ls /usr/bin | shuf -n 1)| sed -n "/^NAME/ {n;p;q}" | tr -s ' ') && echo $text
