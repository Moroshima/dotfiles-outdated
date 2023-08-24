#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

PROXY_HOST='localhost'
PROXY_PORT=7890
PROXY_SOCKS_PORT=7891

export {HTTP_PROXY,http_proxy}="$PROXY_HOST:$PROXY_PORT"
export {HTTPS_PROXY,https_proxy}="$PROXY_HOST:$PROXY_PORT"
export {ALL_PROXY,all_proxy}="$PROXY_HOST:$PROXY_SOCKS_PORT"

proxy() {
    if [[ $* == 'enable' ]]; then
        if [[ $HTTP_PROXY && $HTTPS_PROXY && $ALL_PROXY && $http_proxy && $https_proxy && $all_proxy ]]; then
            echo 'proxy already enabled!'
        else
            export {HTTP_PROXY,http_proxy}="$PROXY_HOST:$PROXY_PORT"
            export {HTTPS_PROXY,https_proxy}="$PROXY_HOST:$PROXY_PORT"
            export {ALL_PROXY,all_proxy}="$PROXY_HOST:$PROXY_SOCKS_PORT"
            echo 'proxy enabled!'
        fi

    elif [[ $* == 'disable' ]]; then
        if [[ $HTTP_PROXY || $HTTPS_PROXY || $ALL_PRXOY || $http_proxy || $https_proxy || $all_proxy ]]; then
            unset {HTTP_PROXY,http_proxy}
            unset {HTTPS_PROXY,https_proxy}
            unset {ALL_PROXY,all_proxy}
            echo 'proxy disabled!'
        else
            echo 'proxy already disabled!'
        fi
    else
        if [[ $HTTP_PROXY || $HTTPS_PROXY || $ALL_PROXY || $http_proxy || $https_proxy || $all_proxy ]]; then
            echo "HTTP_PROXY=${HTTP_PROXY:-'none'}"
            echo "HTTPS_PROXY=${HTTPS_PROXY:-'none'}"
            echo "ALL_PROXY=${ALL_PROXY:-'none'}"
            echo "http_proxy=${http_proxy:-'none'}"
            echo "https_proxy=${https_proxy:-'none'}"
            echo "all_proxy=${all_proxy:-'none'}"
        else
            echo 'proxy is disabled!'
        fi
    fi
}

export AUR_USERNAME='Moroshima'
export AUR_PASSWORD=''
