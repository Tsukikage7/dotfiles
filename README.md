# Dotfiles

现代化的 macOS 开发环境配置，使用 [chezmoi](https://www.chezmoi.io/) 管理。

## 快速开始

### 前置要求

- macOS
- Homebrew
- Git

### 一键安装

```bash
# 安装 chezmoi 并应用配置
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply ChongYanOvO

# 或者手动安装
brew install chezmoi
chezmoi init https://github.com/ChongYanOvO/dotfiles.git
chezmoi apply
```

### 安装依赖

```bash
# 基础工具
brew install fish starship neovim tmux

# 终端模拟器 (任选其一)
brew install --cask kitty
brew install --cask ghostty
brew install --cask wezterm

# 现代化命令行工具
brew install eza bat fd ripgrep fzf jq bottom dust duf fastfetch

# Nerd Font 字体
brew install --cask font-jetbrains-mono-nerd-font

# 设置 Fish 为默认 Shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

## 配置管理

本项目使用 [chezmoi](https://www.chezmoi.io/) 管理 dotfiles，相比 GNU Stow 提供了更多现代化功能：

- 模板支持 (不同机器使用不同配置)
- 内置加密 (安全存储敏感信息)
- 自动 diff 和 merge
- 跨平台支持

### chezmoi 常用命令

```bash
# 查看将要应用的更改
chezmoi diff

# 应用配置到系统
chezmoi apply

# 编辑配置文件 (自动应用更改)
chezmoi edit ~/.config/fish/config.fish

# 添加新的配置文件到管理
chezmoi add ~/.config/xxx/config

# 更新配置 (从远程仓库拉取)
chezmoi update

# 进入 chezmoi 源目录
chezmoi cd

# 查看管理的文件列表
chezmoi managed

# 查看配置状态
chezmoi status
```

### 目录结构

```
dotfiles/
├── dot_config/              # ~/.config/
│   ├── fish/                # Fish Shell
│   ├── kitty/               # Kitty 终端
│   ├── ghostty/             # Ghostty 终端
│   ├── wezterm/             # WezTerm 终端
│   ├── nvim/                # Neovim
│   ├── starship.toml        # Starship 提示符
│   ├── bat/                 # Bat (Everforest 主题)
│   ├── bottom/              # Bottom 系统监控 (Everforest 主题)
│   └── fastfetch/           # Fastfetch
├── dot_tmux/                # ~/.tmux/
├── dot_tmux.conf            # ~/.tmux.conf
├── private_Library/         # ~/Library/ (VSCode 配置)
├── vscode-custom/           # VSCode 自定义 CSS/JS (直接引用)
├── wallpapers/              # 壁纸 (直接引用)
└── .chezmoiignore           # chezmoi 忽略文件
```

> **注意**: `vscode-custom/` 和 `wallpapers/` 目录不通过 chezmoi 复制，而是直接从 dotfiles 目录引用。

## 包含的配置

### Shell 环境

| 工具 | 说明 |
|------|------|
| Fish Shell | 现代化 Shell，智能补全 |
| Starship | 跨平台提示符，Nerd Font 图标 |

### 终端模拟器

| 工具 | 说明 |
|------|------|
| Kitty | GPU 加速，透明背景，光标轨迹 |
| Ghostty | Zig 编写，极低延迟 |
| WezTerm | Lua 配置，跨平台 |

### 编辑器

| 工具 | 说明 |
|------|------|
| Neovim | LazyVim 配置，Go/TypeScript/Markdown 支持 |
| VSCode | Everforest 主题，Go 开发优化 |

### 终端工具

| 工具 | 替代 | 说明 |
|------|------|------|
| eza | ls | 现代化文件列表 |
| bat | cat | 语法高亮 |
| fd | find | 快速文件查找 |
| ripgrep | grep | 快速文本搜索 |
| bottom | top | 系统监控 |
| dust | du | 磁盘分析 |
| duf | df | 磁盘使用 |

### 终端复用

| 工具 | 说明 |
|------|------|
| Tmux | Everforest 主题，TPM 插件管理 |

## 主题配色

统一使用 **Everforest Dark** 主题：
- 终端模拟器: Kitty / Ghostty / WezTerm
- 编辑器: Neovim / VSCode
- 终端复用: Tmux
- 提示符: Starship
- 工具: bat / bottom

统一使用 **LigaMonaco Nerd Font** 字体（含 Nerd Font 图标）。

## 快捷键速查

### Kitty 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Cmd+T` | 新建标签页 |
| `Cmd+W` | 关闭标签页 |
| `Cmd+1-9` | 切换标签页 |
| `Cmd+[` | tmux 垂直分屏 |
| `Cmd+]` | tmux 水平分屏 |
| `Cmd+X` | 关闭 tmux 窗格 |
| `Cmd+D` | 断开 tmux 会话 |
| `Cmd+F` | FZF 搜索历史 |
| `Fn+F` | 切换全屏 |

### Tmux 快捷键

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+Space` | Prefix 键 |
| `Prefix + \|` | 垂直分屏 |
| `Prefix + -` | 水平分屏 |
| `Prefix + r` | 重载配置 |
| `Prefix + f` | FZF 搜索 |
| `Alt + h/j/k/l` | 切换窗格 |
| `Alt + 1-5` | 切换窗口 |

### Fish 缩写

| 缩写 | 命令 |
|------|------|
| `tn <name>` | 新建 tmux 会话 |
| `ta <name>` | 连接 tmux 会话 |
| `tl` | 列出 tmux 会话 |
| `g` | git |
| `ga` | git add |
| `gc` | git commit |
| `gp` | git push |
| `gpl` | git pull |
| `gst` | git status |
| `gd` | git diff |

## 故障排除

### chezmoi 问题

```bash
# 查看详细日志
chezmoi apply -v

# 强制重新应用
chezmoi apply --force

# 查看配置差异
chezmoi diff
```

### 图标显示问题

确保安装了 Nerd Font 并在终端中正确设置：

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Fish Shell 问题

```bash
# 重新加载配置
source ~/.config/fish/config.fish

# 或重启 Fish
exec fish
```

### Tmux 插件问题

```bash
# 安装 TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 在 tmux 中按 Prefix + I 安装插件
```

## 更多资源

- [chezmoi 文档](https://www.chezmoi.io/)
- [Fish Shell 文档](https://fishshell.com/docs/current/)
- [Starship 配置](https://starship.rs/config/)
- [Neovim 文档](https://neovim.io/doc/)
- [Kitty 文档](https://sw.kovidgoyal.net/kitty/)
- [Tmux 文档](https://github.com/tmux/tmux/wiki)

## License

MIT
