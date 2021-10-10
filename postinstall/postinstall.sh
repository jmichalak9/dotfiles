#!/bin/sh

fatal() {
    printf "%s\n" "$1" >&2
    exit 1
}

system_beep_off() {
    printf "Getting rid of that retarded error beep sound...\n"
    rmmod pcspkr
    echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
}

install_vim_plug() {
    printf "Installing vim-plug...\n"
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +qall
}

configure_docker() {
    printf "Docker postinstall operations...\n"
    groupadd docker || printf "Group docker already exists.\n"
    usermod -aG docker $USER
    newgrp docker
}

system_beep_off || fatal "could not turn system beep off"
install_vim_plug || fatal "could not install vim plug"
configure_docker || fatal "could not configure docker"

# TODO: install packages from packages.txt and others
