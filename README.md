# openWrt 定制固件 — Cudy TR3000 v1 (490MB)

## 功能清单

| # | 功能 | 说明 |
|---|------|------|
| 1 | 基础版本 | OpenWrt 25.12.5 稳定版 |
| 2 | Argon 主题 | 已设为默认主题 |
| 3 | UPnP / NAT-PMP | miniupnpd-nftables + LuCI 面板 |
| 4 | SSR Plus+ 软件源 | 默认使用 apk |
| 5 | UBI 分区扩展 | DTS 中64MB→490MB |
| 6 | 首次启动预设 | 无密码、192.168.1.1、WiFi开启（Cudy / Cudy-5G）|
| 7 | 官方预装包 | 全部保留 |
| 8 | 中兴F50驱动 | kmod-mii / usb-net / cdc-ether / rndis |

---

## 使用 GitHub Actions 编译（推荐）

### 步骤

1. **Fork 本仓库**到你的 GitHub 账号

2. 进入你 fork 的仓库 → **Actions** → 启用 Workflows

3. 点击左侧 **Build ImmortalWrt for Cudy TR3000 v1** → **Run workflow**

4. 等待约 **2~3 小时**编译完成

### 重要提醒：检查 DTS 补丁
