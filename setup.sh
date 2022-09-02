#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ "$(command -v apt)" != "" ]]; then
	    sudo apt update
      sudo apt upgrade -y
        sudo apt install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract device-tree-compiler liblzma-dev python3-pip brotli liblz4-tool axel gawk aria2 detox cpio rename liblz4-dev jq neofetch
        sudo apt install -y aria2 arj brotli cabextract cmake device-tree-compiler gcc g++ git liblz4-tool liblzma-dev libtinyxml2-dev lz4 mpack openjdk-11-jdk p7zip-full p7zip-rar python3 python3-pip rar sharutils unace unrar unzip uudeview xz-utils zip zlib1g-dev
    elif [[ "$(command -v dnf)" != "" ]]; then
        sudo dnf install -y unace unrar zip unzip sharutils uudeview arj cabextract file-roller dtc python3-pip brotli axel aria2 detox cpio lz4 python3-devel xz-devel p7zip p7zip-plugins
    elif [[ "$(command -v pacman)" != "" ]]; then
        sudo pacman -Syyu --needed --noconfirm 2>&1 | grep -v "warning: could not get file information"
        sudo pacman -Sy --noconfirm unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc brotli axel gawk aria2 detox cpio lz4 jq

        # python
        sudo ln -sf /usr/bin/pip3.10 /usr/bin/pip3
        sudo ln -sf /usr/bin/pip3.10 /usr/bin/pip
        sudo ln -sf /usr/bin/python3.10 /usr/bin/python3
        sudo ln -sf /usr/bin/python3.10 /usr/bin/python
    fi
    PIP=pip3
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2 detox coreutils p7zip gawk
    PIP=pip
fi

sudo "$PIP" install backports.lzma extract-dtb protobuf==3.20.0 pycrypto docopt zstandard twrpdtgen future requests humanize clint lz4 pycryptodome

# aospdtgen
$PIP install git+https://github.com/SebaUbuntu/aospdtgen

# Exit
exit 0
