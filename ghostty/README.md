# Ghostty 终端配置

现代化的 GPU 加速终端模拟器配置，专为 macOS 优化。

## 安装

### 1. 安装 Ghostty

```bash
brew install --cask ghostty
```

### 2. 部署配置

```bash
cd ~/dotfiles
stow ghostty
```

### 3. 验证配置

```bash
# 检查配置文件是否正确链接
ls -la ~/.config/ghostty/config

# 启动 Ghostty 测试
open -a Ghostty
```

## 配置说明

### 字体设置

默认使用 **JetBrainsMono Nerd Font**，字号为 14。

如需修改字体：
```
font-family = Your Preferred Nerd Font
font-size = 16
```

### 主题配置

默认使用内置主题，您可以：

1. **使用内置主题：**
   ```bash
   # 查看可用主题
   ghostty +list-themes
   ```

   然后在配置文件中修改：
   ```
   theme = catppuccin-mocha
   ```

2. **自定义颜色：**
   取消注释配置文件中的自定义颜色部分，并根据需要调整。

### 窗口透明度

默认为不透明（1.0），可调整范围 0.0-1.0：
```
background-opacity = 0.95
```

### 快捷键

主要快捷键（macOS 风格）：

| 快捷键 | 功能 |
|--------|------|
| `Cmd + C` | 复制 |
| `Cmd + V` | 粘贴 |
| `Cmd + T` | 新建标签 |
| `Cmd + W` | 关闭标签 |
| `Cmd + N` | 新建窗口 |
| `Cmd + D` | 垂直分屏 |
| `Cmd + Shift + D` | 水平分屏 |
| `Cmd + 1-9` | 切换到第 N 个标签 |

## 特性

- ✅ GPU 硬件加速
- ✅ 极低输入延迟
- ✅ 支持 Nerd Font 图标
- ✅ 原生 macOS 体验
- ✅ 分屏和标签管理
- ✅ Fish Shell 集成

## 进阶配置

### Shell 集成

如需启用 Ghostty 的 Shell 集成功能，取消注释：
```
shell-integration = fish
shell-integration-features = cursor,sudo,title
```

### 性能优化

配置已默认启用 GPU 加速，如遇性能问题可尝试：
```
gpu-acceleration = true
```

## 常见问题

### 图标显示为方块？

确保已安装 Nerd Font：
```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### 配置未生效？

1. 检查符号链接：
   ```bash
   ls -la ~/.config/ghostty/config
   ```

2. 重新部署配置：
   ```bash
   cd ~/dotfiles
   stow -R ghostty
   ```

3. 重启 Ghostty

## 更多资源

- [Ghostty 官方文档](https://ghostty.org/docs)
- [Ghostty GitHub](https://github.com/ghostty-org/ghostty)
- [配置文件参考](https://ghostty.org/docs/config)

## 卸载配置

```bash
cd ~/dotfiles
stow -D ghostty
```
