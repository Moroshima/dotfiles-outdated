# Set proxy shell function
proxy() {
    if [[ $@ == 'enable' ]]; then
        # Get host ip
        export HOST_IP=$(ip route | grep default | awk '{print $3}');
        export PROXY_PORT=7890;
        export ALL_PROXY="socks5://$HOST_IP:$PROXY_PORT";
        export all_proxy="socks5://$HOST_IP:$PROXY_PORT";
        export http_proxy="http://$HOST_IP:$PROXY_PORT";
        export https_proxy="http://$HOST_IP:$PROXY_PORT";
    elif [[ $@ == 'disable' ]]; then
        unset ALL_PROXY;
        unset all_proxy;
        unset http_proxy;
        unset https_proxy;
    else
        echo 'ALL_PROXY   =' ${ALL_PROXY:-'none'};
        echo 'all_proxy   =' ${all_proxy:-'none'};
        echo 'http_proxy  =' ${http_proxy:-'none'};
        echo 'https_proxy =' ${https_proxy:-'none'};
    fi
}

# Enable proxy
proxy enable

# Initialize starship
eval "$(starship init bash)"