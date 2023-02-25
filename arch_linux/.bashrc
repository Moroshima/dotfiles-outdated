#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR='vim'

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

eval "$(starship init bash)"

proxy() {
    if [[ $* == 'enable' ]]; then
        if [[ $HTTP_PROXY && $HTTPS_PROXY && $FTP_PROXY && $ALL_PROXY && $all_proxy && $ftp_proxy && $http_proxy && $https_proxy ]]; then
            echo 'proxy already enabled!'
        else
            export {HTTP_PROXY,http_proxy}='http://localhost:7890'
            export {HTTPS_PROXY,https_proxy}='http://localhost:7890'
            export {FTP_PROXY,ftp_proxy}='http://localhost:7890'
            export {ALL_PROXY,all_proxy}='socks://localhost:7891'
            echo 'proxy enabled!'
        fi

    elif [[ $* == 'disable' ]]; then
        if [[ $HTTP_PROXY || $HTTPS_PROXY || $FTP_PROXY || $ALL_PRXOY || $http_proxy || $https_proxy || $ftp_proxy || $all_proxy ]]; then
            unset {HTTP_PROXY,http_proxy}
            unset {HTTPS_PROXY,https_proxy}
            unset {FTP_PROXY,ftp_proxy}
            unset {ALL_PROXY,all_proxy}
            echo 'proxy disabled!'
        else
            echo 'proxy already disabled!'
        fi
    else
        if [[ $all_proxy || $ftp_proxy || $http_proxy || $https_proxy ]]; then
            echo "HTTP_PROXY=${HTTP_PROXY:-'none'}"
            echo "HTTPS_PROXY=${HTTPS_PROXY:-'none'}"
            echo "FTP_PROXY=${FTP_PROXY:-'none'}"
            echo "ALL_PROXY=${ALL_PROXY:-'none'}"
	    echo "http_proxy=${http_proxy:-'none'}"
	    echo "https_proxy=${https_proxy:-'none'}"
	    echo "ftp_proxy=${ftp_proxy:-'none'}"
	    echo "all_proxy=${all_proxy:-'none'}"
        else
            echo 'proxy is disabled!'
        fi
    fi
}

export AUR_USERNAME='Moroshima'
export AUR_PASSWORD=''

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

eval "$(rbenv init -)"

. "$HOME/.cargo/env"

[ -f "/home/moroshima/.ghcup/env" ] && source "/home/moroshima/.ghcup/env" # ghcup-env
