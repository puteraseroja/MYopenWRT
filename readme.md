# OpenWRT compiled by PuteraSeroja


## HOW TO COMPILE
https://openwrt.org/docs/guide-developer/toolchain/install-buildsystem <br>

## Prerequisites <br>
> open terminal


`````
sudo apt update
sudo apt install build-essential gawk gcc-multilib flex git gettext libncurses5-dev libssl-dev python3-distutils zlib1g-dev
git clone https://github.com/udhos/update-golang
cd update-golang
sudo ./update-golang.sh
`````

## Compile with Passwall
`````````
git clone https://git.openwrt.org/openwrt/openwrt.git
cd openwrt
git checkout v22.03.2
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
./scripts/feeds update -a
./scripts/feeds install -a
wget https://downloads.openwrt.org/releases/22.03.2/targets/ramips/mt7621/config.buildinfo -O .config
make defconfig
make menuconfig
`````````
**`### openwrt version and links used above are for example only ###`** <br><br>

#### Menuconfig Hotkeys:
> [ENTER]=SELECT <br>
> [Y]=INCLUDE <br>
> [M]=MODULERISE <br>
> [N]=EXCLUDE <br>
> [ESC][ESC]=exit (press double ESC) <br>

#### Additional config for AARCH64:
> select Languages--> Go--> Configuration--> External bootstrap Go root directory <br>
> set /usr/local/go <br>
> [ESC][ESC]<br>

#### Luci Modules Config
> select Luci --> Modules--> <br>
> [Y] luci-compat <br>
> [ESC][ESC] <br><br>

#### Luci Apps Config
> select Luci --> Applications--> <br>
  > [Y] luci-app-passwall <br>
    configuration--> <br>
      [Y] Transparent Proxy <br>
      [Y] Include ShadowsocksR Libev Client <br>
      [Y] Include Trojan-Plus <br>
      [Y] Include Xray <br>
> [ESC][ESC] <br>

### save and then exit <br>

```
make package/feeds/packages/golang/host/compile V=s
make -j5 download
make -j1 V=s
```
> completed

#### Succesfull compiled file can be found on \*/openwrt/bin/targets/`ramips/mt7621`

## Good Luck !
