#!/bin/bash

function install_dev() {
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt install apt-transport-https ca-certificates
    sudo apt-get install build-essential
    sudo apt-get install autoconf automake libtool curl make gcc g++ unzip
    sudo apt-get install vim
    # sudo apt-get install linux-tools-common linux-tools-generic
    sudo apt-get install linux-headers-$(uname -r)
    sudo apt-get install pkgconf
    sudo apt-get install pkg-config
    sudo apt-get install gdb cgdb gdbserver
    sudo apt-get install linux-perf
    sudo apt-get install sysstat
    sudo apt-get install nethogs
    sudo apt-get install zlib1g-dev
    sudo apt-get install libpcre3 libpcre3-dev
    sudo apt-get install wireguard
    sudo apt-get install wget
    sudo apt-get install curl
    sudo apt-get install openssl
    sudo apt-get install openssh-client
    sudo apt-get install git
    sudo apt-get install cmake
    sudo apt-get install clang-format
    sudo apt-get install dstat
    sudo apt-get install strace
    sudo apt-get install bpftool
    sudo apt-get install mesa-vulkan-drivers
    sudo apt-get install libvulkan*
    sudo apt-get install graphviz
    sudo apt-get install libicu-dev
    sudo apt-get install libsdl2-2.0 libsdl2-dev
    sudo apt install x264 libx264-dev
    sudo apt-get install iptables
    sudo apt-get install ufw
}

function usage() {
    scriptname=`basename ${0}`
    echo "USAGE ${scriptname}(${1});"
    echo $@
    echo $*
    echo "param  = $@"
    echo "param  = $*"
}


usage $@
