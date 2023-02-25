# dotfiles

此 repo 用于存储个人的 dotfiles 配置

| 文件夹                      | 独有 |
| --------------------------- | ---- |
| arch_linux                  | ●    |
| fedora_linux                | ●    |
| linux_distro_independent    | ○    |
| shared                      | ○    |
| windows_11                  | ●    |
| windows_subsystem_for_linux | ●    |

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
  "profiles": {
    "defaults": {
      "cursorShape": "filledBox",
      "opacity": 70,
      "useAcrylic": true
    }
  }
}
```

## Windows Subsystem for Linux

*以 Debian GNU/Linux 为目标系统

禁用跨系统互操作性

```
/etc/wsl.conf
```

```toml
# Set whether WSL supports interop process like launching Windows apps and adding path variables. Setting these to false will block the launch of Windows processes and block adding $PATH environment variables.
[interop]
enabled = false
appendWindowsPath = false
```

详见 [WSL 中的高级设置配置 | Microsoft Learn](https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config)
