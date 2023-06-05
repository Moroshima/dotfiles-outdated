# dotfiles

此 repo 用于存储个人的 dotfiles 配置

| 文件夹                      | 适用系统                     | 独有 |
| --------------------------- | ---------------------------- | ---- |
| arch_linux                  | Arch Linux                   | ✅    |
| linux_distro_independent    | 所有 GNU/Linux 发行版        |      |
| windows_nt_and_linux_shared | GNU/Linux 与 Windows NT 通用 |      |
| windows_11                  | Windows 11                   | ✅    |
| windows_subsystem_for_linux | WSL (Debian)                 | ✅    |

```tree
.
├── arch_linux
│   ├── .bashrc
│   └── .local
│       └── share
│           └── applications
│               ├── avahi-discover.desktop
│               ├── bssh.desktop
│               ├── bvnc.desktop
│               ├── htop.desktop
│               ├── lstopo.desktop
│               ├── qv4l2.desktop
│               ├── qvidcap.desktop
│               └── vim.desktop
├── linux_distro_independent
│   ├── .cabal
│   │   └── config
│   ├── .config
│   │   └── ibus
│   │       └── rime
│   │           ├── default.custom.yaml
│   │           ├── ibus_rime.custom.yaml
│   │           └── luna_pinyin_simp.custom.yaml
│   ├── .gitconfig
│   └── .ssh
│       └── config
├── README.md
├── windows_11
│   ├── .config
│   │   └── clash
│   │       └── cfw-settings.yaml
│   ├── Documents
│   │   └── PowerShell
│   │       └── Microsoft.PowerShell_profile.ps1
│   ├── .gitconfig
│   └── .ssh
│       └── config
├── windows_nt_and_linux_shared
│   ├── .config
│   │   └── starship.toml
│   └── .npmrc
└── windows_subsystem_for_linux
    └── .bashrc
```

## Fedora

### 关于 nc alias 差异导致的 ssh ProxyCommand 无法工作

在 fedora 上 nc 默认为 nmap-ncat 的 alias，而非其他系统中常见的将其作为 netcat 的 alias，因此可能需要为 Fedora Linux 单独修改 `.ssh/config` 中的 `ProxyCommand` 命令参数。

### fix hid_apple fnmode issue

使用如下脚本文件

```bash
vim fix-keychron-k1-fn.sh
```

```
#!/usr/bin/env bash

FNMODE=2

# session fix
echo $FNMODE | sudo tee /sys/module/hid_apple/parameters/fnmode

# permanent fix
# https://ask.fedoraproject.org/t/getting-the-function-keys-to-work-properly-with-a-varmilo-keyboard/11297
echo "options hid_apple fnmode=$FNMODE" | sudo tee /etc/modprobe.d/hid_apple.conf
echo 'install_items+=/etc/modprobe.d/hid_apple.conf' | sudo tee /etc/dracut.conf.d/hid_apple.conf
sudo dracut --force
```

```bash
sudo ./fix-keychron-k1-fn.sh
```

## Windows 11

使用 winget 快速搭建生产环境

```powershell
winget install -i --id OpenJS.NodeJS.LTS
winget install -i --id Microsoft.VisualStudioCode
winget install -i --id Git.Git
winget install -i --id GnuPG.Gpg4win
```

Windows Terminal 配置

```json
{
    "initialCols": 110,
    "profiles": 
    {
        "defaults": 
        {
            "cursorShape": "filledBox",
            "opacity": 95,
            "useAcrylic": true
        },
    },
    "useAcrylicInTabRow": true
}
```

## Windows Subsystem for Linux

*以 Debian GNU/Linux 为目标系统

禁用跨系统互操作性

```path
sudo vim /etc/wsl.conf
```

```conf
# Set whether WSL supports interop process like launching Windows apps and adding path variables. Setting these to false will block the launch of Windows processes and block adding $PATH environment variables.
[interop]
enabled = false
appendWindowsPath = false
```

详见 [WSL 中的高级设置配置 | Microsoft Learn](https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config)
