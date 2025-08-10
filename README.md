# 个人 Dotfiles 配置

## 下载配置文件

```bash
git clone https://github.com/ChongYanOvO/dotfiles ~/dotfiles
```

## 使用 `stow` 来管理配置文件

`stow` GitHub 链接 🔗: [stow](https://github.com/aspiers/stow)

### 安装 stow

```bash
brew install stow
```

### 使用示例

```bash
cd ~/dotfiles
stow <配置名称>
```

## Shell 配置

### Fish Shell 🐟

现代化的 shell，具有智能自动补全和语法高亮。

**安装:**
```bash
brew install fish
```

**配置:**
```bash
cd ~/dotfiles
stow fish
```

**特性:**
- 智能缩写系统 (abbreviations)
- 分类管理的快捷命令
- `als` 命令查看所有缩写
- Git 工作流优化

## 终端模拟器

### WezTerm

`WezTerm` 官网 🔗: [wezterm](https://wezfurlong.org/wezterm/)

**安装:**
```bash
brew install --cask wezterm
```

**配置:**
```bash
cd ~/dotfiles
stow wezterm
```

### Kitty

**安装:**
```bash
brew install --cask kitty
```

**配置:**
```bash
cd ~/dotfiles
stow kitty
```

## 终端提示符

### Starship ⭐

跨 shell 的现代化提示符，支持 Fish。

**安装:**
```bash
brew install starship
```

**配置:**
```bash
cd ~/dotfiles
stow starship
```

**特性:**
- Nerd Font 图标支持
- 编程语言版本显示 (Node.js, Python, Rust, Go, Java)
- Git 状态显示
- Docker 上下文显示
- 命令执行时间统计

## 编辑器

### Neovim

`Neovim` 官网 🔗: [neovim.io](https://neovim.io/)

**安装:**
```bash
brew install neovim
```

**配置:**
```bash
cd ~/dotfiles
stow nvim
```

## 终端工具

### 系统监控和文件工具

**安装所有工具:**
```bash
brew install eza dust duf bottom bat fastfetch jq ripgrep fd
```

- **eza** - 现代化的 `ls` 替代品
- **dust** - 直观的磁盘使用分析器
- **duf** - 现代化的 `df` 替代品
- **bottom** - 系统监控工具
- **bat** - 增强版 `cat` 命令
- **fastfetch** - 系统信息显示工具
- **jq** - JSON 处理工具
- **ripgrep** - 快速文本搜索
- **fd** - 用户友好的 `find` 替代品

### Bat 配置

`bat` GitHub 链接 🔗: [bat](https://github.com/sharkdp/bat)

**配置:**
```bash
cd ~/dotfiles
stow bat
```

**维护命令:**
```bash
bat cache --clear
bat cache --build
```

### Fastfetch 配置

`fastfetch` GitHub 链接 🔗: [fastfetch](https://github.com/LinusDierheimer/fastfetch)

**配置:**
```bash
cd ~/dotfiles
stow fastfetch
```

### Bottom 系统监控

**配置:**
```bash
cd ~/dotfiles
stow bottom
```

## 终端复用器

### Tmux

`tmux` 官网 🔗: [tmux](https://github.com/tmux/tmux)

**安装:**
```bash
brew install tmux
```

**配置:**
```bash
cd ~/dotfiles
stow tmux
```

## SSH 工具

### tssh

终端 SSH 客户端工具。

**配置:**
```bash
cd ~/dotfiles
stow tssh
```

## Python 配置

### pip 配置

**配置:**
```bash
cd ~/dotfiles
stow pip
```

## 图片上传工具

### PicGo

`PicGo` GitHub 链接 🔗: [PicGo](https://github.com/Molunerfinn/PicGo)

**安装:**
```bash
brew install picgo --cask
sudo xattr -d com.apple.quarantine "/Applications/PicGo.app"
```

## 推荐的配置顺序

1. 安装基础工具和字体
2. 配置 Fish shell
3. 配置 Starship 提示符
4. 配置终端模拟器 (WezTerm 或 Kitty)
5. 配置 Neovim
6. 配置终端工具
7. 配置 Tmux (可选)

## 字体要求

建议安装 Nerd Font 以获得最佳图标显示效果:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## 注意事项

- 所有配置文件使用符号链接，修改后会自动同步
- Fish shell 配置包含完整的缩写系统和 Git 工作流
- Starship 配置使用 Nerd Font 图标，需要支持的字体
- 部分配置可能需要重启终端才能生效