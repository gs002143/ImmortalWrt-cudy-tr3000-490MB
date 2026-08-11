#!/bin/bash

# ========== 1. 扩大 UBI 到约 490MB（硬改 512MB） ==========
# 原 ubootmod 为 0x7a40000 (~122MB)
# 0x1EA00000 ≈ 490.2 MiB
sed -i 's/reg = <0x5c0000 0x7a40000>;/reg = <0x5c0000 0x1EA00000>;/' target/linux/mediatek/dts/mt7981b-cudy-tr3000-v1-ubootmod.dts

# ========== 2. 默认软件包（官方 + 需求） ==========
# 在 DEVICE_PACKAGES 或通过 .config 添加
cat >> .config <<EOF
CONFIG_TARGET_mediatek=y
CONFIG_TARGET_mediatek_filogic=y
CONFIG_TARGET_mediatek_filogic_DEVICE_cudy_tr3000-v1-ubootmod=y

# 官方默认包（已包含大部分）
CONFIG_PACKAGE_autocore=y
CONFIG_PACKAGE_base-files=y
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_bridger=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_default-settings-chn=y
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_dropbear=y
CONFIG_PACKAGE_firewall4=y
CONFIG_PACKAGE_fitblk=y
CONFIG_PACKAGE_fstools=y
CONFIG_PACKAGE_kmod-crypto-hw-safexcel=y
CONFIG_PACKAGE_kmod-gpio-button-hotplug=y
CONFIG_PACKAGE_kmod-leds-gpio=y
CONFIG_PACKAGE_kmod-nf-nathelper=y
CONFIG_PACKAGE_kmod-nf-nathelper-extra=y
CONFIG_PACKAGE_kmod-nft-offload=y
CONFIG_PACKAGE_kmod-phy-aquantia=y
CONFIG_PACKAGE_libc=y
CONFIG_PACKAGE_libgcc=y
CONFIG_PACKAGE_libustream-openssl=y
CONFIG_PACKAGE_logd=y
CONFIG_PACKAGE_luci-app-package-manager=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-base=y
CONFIG_PACKAGE_luci-lib-ipkg=y
CONFIG_PACKAGE_luci-light=y
CONFIG_PACKAGE_mtd=y
CONFIG_PACKAGE_netifd=y
CONFIG_PACKAGE_nftables=y
CONFIG_PACKAGE_odhcp6c=y
CONFIG_PACKAGE_odhcpd-ipv6only=y
CONFIG_PACKAGE_opkg=y
CONFIG_PACKAGE_ppp=y
CONFIG_PACKAGE_ppp-mod-pppoe=y
CONFIG_PACKAGE_procd-ujail=y
CONFIG_PACKAGE_uboot-envtools=y
CONFIG_PACKAGE_uci=y
CONFIG_PACKAGE_uclient-fetch=y
CONFIG_PACKAGE_urandom-seed=y
CONFIG_PACKAGE_urngd=y
CONFIG_PACKAGE_wpad-openssl=y
CONFIG_PACKAGE_kmod-usb3=y
CONFIG_PACKAGE_kmod-mt7915e=y
CONFIG_PACKAGE_kmod-mt7981-firmware=y
CONFIG_PACKAGE_mt7981-wo-firmware=y
CONFIG_PACKAGE_automount=y

# Argon
CONFIG_PACKAGE_luci-theme-argon=y
CONFIG_PACKAGE_luci-app-argon-config=y

# UPnP IGD + PCP/NAT-PMP
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_miniupnpd-nftables=y

# SSR Plus+ + 透明代理依赖（Nftables）
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_Nftables_Transparent_Proxy=y
CONFIG_PACKAGE_xray-core=y
CONFIG_PACKAGE_shadowsocks-rust-sslocal=y
CONFIG_PACKAGE_shadowsocksr-libev-ssr-redir=y
CONFIG_PACKAGE_ipt2socks=y
CONFIG_PACKAGE_dns2tcp=y
CONFIG_PACKAGE_microsocks=y
CONFIG_PACKAGE_chinadns-ng=y
CONFIG_PACKAGE_v2ray-geoip=y
CONFIG_PACKAGE_v2ray-geosite=y

# USB 网络驱动（中兴 F50 RNDIS/CDC）
CONFIG_PACKAGE_kmod-mii=y
CONFIG_PACKAGE_kmod-usb-net=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_kmod-usb-net-rndis=y

# SFTP
CONFIG_PACKAGE_openssh-sftp-server=y

# 双 WAN 自动切换
CONFIG_PACKAGE_luci-app-mwan3=y
CONFIG_PACKAGE_mwan3=y

# 其他实用
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_wget-ssl=y
EOF

# 使配置生效
make defconfig
