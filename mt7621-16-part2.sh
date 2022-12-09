#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Enable wifi
sed -i 's/set wireless.radio${devidx}.disabled=1/set wireless.radio${devidx}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change SSID
sed -i "s/set wireless.default_radio\${devidx}.ssid=\(^.*\)/wireless.default_radio\${devidx}.ssid=PuteraSeroja\${mode_band}/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change hostname
sed -i "s/system.@system[-1].hostname='OpenWrt'/set system.@system[-1].hostname='PuteraSeroja'/g" package/base-files/files/bin/config_generate

# Set Description and Notes
echo "system.@system[-1].description='compiled by puteraseroja'"
echo "system.@system[-1].notes='this firmware is free. download  at telegram channel: t.me/+3j15vqnEPihmNWQ1'/g" >>package/base-files/files/bin/config_generate
