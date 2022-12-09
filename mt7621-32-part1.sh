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

# Enable wifi
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change SSID
sed -i "s/set wireless.default_radio\${devidx}.ssid=\(^.*\)/wireless.default_radio\${devidx}.ssid=PuteraSeroja\${mode_band}/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change hostname
sed -i "s/system.@system[-1].hostname='OpenWrt'/set system.@system[-1].hostname='PuteraSeroja'/g" package/base-files/files/bin/config_generate

# Set Description and Notes
#echo "system.@system[-1].description='compiled by puteraseroja'"
#echo "system.@system[-1].notes='this firmware is free. download  at telegram channel: t.me/+3j15vqnEPihmNWQ1'/g" >>package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
#sed -i 's/luci-theme-bootstrap/luci-theme-material/g' feeds/luci/collections/luci/Makefile

# Add the default password for the 'root' user（Change the empty password to 'password'）
#sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
#sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
#echo "DISTRIB_SOURCECODE='official'" >>package/base-files/files/etc/openwrt_release

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git https://github.com/puteraseroja/kenzok8-packages' >>feeds.conf.default
