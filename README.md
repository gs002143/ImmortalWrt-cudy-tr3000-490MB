# ImmortalWrt 24.10 for Cudy TR3000 v1 (512MB Hardmod)

基于 ImmortalWrt `openwrt-24.10`（对应 24.10.6 系列）定制固件。

## 特性
- 设备：Cudy TR3000 v1（硬改 512MB 闪存，已刷 3 分区 U-Boot）
- UBI 分区扩大至约 **490MB**
- 预装 luci-theme-argon + argon-config
- 预装 luci-app-upnp（UPnP IGD + PCP/NAT-PMP，nftables）
- 预装 SSR Plus+（fw876/helloworld）+ Nftables 透明代理完整依赖
- 预装 USB 网络驱动（支持中兴 F50 RNDIS/CDC-Ether）
- 预装 openssh-sftp-server
- 首次启动预设：
  - 无登录密码
  - LAN：192.168.1.1
  - WiFi 开启，2.4G SSID=`Cudy`，5G SSID=`Cudy-5G`
  - WAN + USB（usb0）双上网，mwan3 自动切换（WAN 优先）

## 使用说明
1. 使用已刷的 3 分区 U-Boot 进入系统。
2. 刷写 `*-squashfs-sysupgrade.bin` 或 `.itb`。
3. 首次启动后建议修改 WiFi 密码和 root 密码。
4. 插入中兴 F50 后，usb0 会自动出现并参与 mwan3 故障转移。

## 编译
直接在 GitHub Actions 触发 `workflow_dispatch` 即可。
