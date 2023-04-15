#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sudo add-apt-repository ppa:ubuntu-toolchain-r/test

# 备份
sudo cp /etc/apt/sources.list.d/ubuntu-toolchain-r-ubuntu-test-bionic.list /etc/apt/sources.list.d/ubuntu-toolchain-r-ubuntu-test-bionic.list.zjr

# 修改
cat /etc/apt/sources.list.d/ubuntu-toolchain-r-ubuntu-test-bionic.list
#deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu bionic main
# deb-src http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu bionic main
deb https://launchpad.proxy.ustclug.org/ubuntu-toolchain-r/test/ubuntu bionic main
# deb-src https://launchpad.proxy.ustclug.org/ubuntu-toolchain-r/test/ubuntu bionic main

sudo apt update
sudo apt install gcc-9 g++-9

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 10

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 1
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 1

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
