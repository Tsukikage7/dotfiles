# 个人 Dotfiles 配置

现代化的跨平台开发环境配置，基于 Fish Shell + Starship + 现代终端工具的完整解决方案。

## 🚀 快速开始

### 前置要求

- macOS 系统
- Homebrew 包管理器
- Git

### 一键安装

```bash
# 1. 克隆配置
git clone https://github.com/ChongYanOvO/dotfiles ~/dotfiles
cd ~/dotfiles

# 2. 安装 Homebrew (如果未安装)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. 安装 GNU Stow
brew install stow

# 4. 安装基础工具
brew install fish starship neovim tmux
brew install eza dust duf bottom bat fastfetch jq ripgrep fd

# 5. 安装 Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# 6. 配置 Fish Shell 为默认 Shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# 7. 部署配置文件
stow fish starship

# 8. 重启终端或执行
exec fish
```

## 📦 配置管理

本项目使用 [GNU Stow](https://github.com/aspiers/stow) 来管理配置文件的符号链接。

### Stow 工作原理

Stow 通过创建符号链接将 dotfiles 仓库中的配置文件链接到系统对应位置。

**示例：** 运行 `stow fish` 后：
```
~/dotfiles/fish/.config/fish/config.fish  →  ~/.config/fish/config.fish (符号链接)
```

### 可用的配置包

| 配置包 | 说明 | 部署命令 |
|--------|------|----------|
| **fish** | Fish Shell 配置 | `stow fish` |
| **starship** | Starship 提示符配置 | `stow starship` |
| **ghostty** | Ghostty 终端配置 | `stow ghostty` |
| **kitty** | Kitty 终端配置 | `stow kitty` |
| **wezterm** | WezTerm 终端配置 | `stow wezterm` |
| **nvim** | Neovim 编辑器配置 | `stow nvim` |
| **vscode** | VSCode 编辑器配置 | `stow vscode` |
| **tmux** | Tmux 终端复用器配置 | `stow tmux` |
| **bat** | Bat 工具配置 | `stow bat` |
| **bottom** | Bottom 系统监控配置 | `stow bottom` |
| **fastfetch** | Fastfetch 系统信息配置 | `stow fastfetch` |
| **tssh** | TSSH 配置 | `stow tssh` |
| **pip** | Python pip 配置 | `stow pip` |

### Stow 使用方法

```bash
# 进入 dotfiles 目录
cd ~/dotfiles

# 部署单个配置
stow fish

# 部署多个配置
stow fish starship ghostty vscode

# 部署所有配置（谨慎使用）
stow */

# 取消部署配置
stow -D fish

# 重新部署配置（配置更新后使用）
stow -R fish

# 查看将要执行的操作（不实际执行）
stow -n fish

# 详细输出模式（查看详细操作过程）
stow -v fish

# 非常详细的输出
stow -vv fish
```

### 常见使用场景

**首次设置：**
```bash
cd ~/dotfiles
stow fish starship ghostty vscode
```

**更新配置后：**
```bash
cd ~/dotfiles
stow -R fish  # 重新部署 fish 配置
```

**切换终端：**
```bash
# 取消 Kitty，启用 Ghostty
stow -D kitty
stow ghostty
```

**检查配置：**
```bash
# 查看配置链接是否正确
ls -la ~/.config/fish
ls -la ~/.config/ghostty
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

### Ghostty

`Ghostty` 官网 🔗: [ghostty.org](https://ghostty.org/)

现代化的 GPU 加速终端模拟器，由 Zig 编写，性能优异。

**安装:**
```bash
brew install --cask ghostty
```

**配置:**
```bash
cd ~/dotfiles
stow ghostty
```

**特性:**
- 原生 GPU 加速渲染
- 极低的输入延迟
- 支持 Nerd Font 图标
- 现代化的配置系统
- macOS 原生体验

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

### Visual Studio Code

`VSCode` 官网 🔗: [code.visualstudio.com](https://code.visualstudio.com/)

现代化的代码编辑器，支持丰富的扩展生态。

**安装:**
```bash
brew install --cask visual-studio-code
```

**配置:**
```bash
cd ~/dotfiles
stow vscode
```

**特性:**
- LigaMonaco Nerd Font 字体
- 自动格式化和保存
- Fish Shell 集成
- Git 智能提交
- 多语言代码片段

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

## 📋 详细配置指南

### 推荐的配置顺序

1. **基础环境** - Homebrew + Git
2. **Shell 环境** - Fish Shell + Starship
3. **终端模拟器** - Ghostty、Kitty 或 WezTerm (任选其一)
4. **编辑器** - Neovim
5. **终端工具** - eza, bat, bottom 等
6. **终端复用器** - Tmux (可选)

### 字体配置

**必需：** 安装 Nerd Font 以获得完整的图标显示效果

```bash
# 安装推荐字体
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font

# 其他可选字体
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack-nerd-font
```

**配置终端字体：**
- Ghostty: 编辑 `~/.config/ghostty/config`
- Kitty: 编辑 `~/.config/kitty/kitty.conf`
- WezTerm: 编辑 `~/.config/wezterm/wezterm.lua`
- 系统终端: 偏好设置 → 字体

## ✅ 配置验证

### 验证 Fish Shell

```bash
# 检查 Fish 是否为默认 shell
echo $SHELL

# 检查缩写是否加载
abbr --list | head -10

# 检查 starship 是否运行
echo $STARSHIP_CONFIG
```

### 验证工具安装

```bash
# 检查现代工具是否可用
eza --version
bat --version
bottom --version
starship --version
```

## 🔧 故障排除

### Fish Shell 问题

**问题：** 缩写 (abbreviations) 未加载
```bash
# 解决方案：重新加载配置
source ~/.config/fish/config.fish

# 或重启 Fish
exec fish
```

**问题：** 命令找不到 (如 `eza`)
```bash
# 检查 PATH
echo $PATH

# 重新加载 Fish 配置
source ~/.config/fish/config.fish
```

### Starship 提示符问题

**问题：** Starship 未显示或显示异常
```bash
# 检查配置路径
echo $STARSHIP_CONFIG

# 测试配置文件
starship config

# 重新初始化
starship init fish | source
```

**问题：** 图标显示为方块
- 确保安装了 Nerd Font
- 在终端中设置正确的字体

### Stow 符号链接问题

**问题：** 配置文件未生效
```bash
# 检查符号链接状态
ls -la ~/.config/fish
ls -la ~/.config/ghostty
ls -la ~/.config/starship.toml

# 重新部署
cd ~/dotfiles
stow -R fish starship ghostty
```

**问题：** Stow 报错 "existing target is not owned by stow"
```bash
# 原因：目标位置已存在非符号链接的文件/目录
# 解决方案1：备份并删除现有文件
mv ~/.config/fish ~/.config/fish.backup
stow fish

# 解决方案2：强制重新部署（会删除现有文件）
stow --adopt fish  # 谨慎使用
```

**问题：** Stow 报错 "conflicts"
```bash
# 查看详细冲突信息
stow -v fish

# 手动解决冲突：删除冲突的文件或目录
rm -rf ~/.config/fish/conflicting-file

# 然后重新部署
stow fish
```

**问题：** 符号链接指向错误的位置
```bash
# 取消部署
stow -D fish

# 删除错误的符号链接
rm ~/.config/fish

# 重新部署
stow fish
```

**问题：** VSCode 配置未生效
```bash
# 检查 VSCode 配置符号链接
ls -la ~/Library/Application\ Support/Code/User/

# 如果没有符号链接，重新部署
cd ~/dotfiles
stow -R vscode
```

### 权限问题

```bash
# 修复配置文件权限
chmod 644 ~/.config/fish/config.fish
chown -R $(whoami) ~/.config/fish

# 修复整个 dotfiles 目录权限
cd ~/dotfiles
chmod -R u+rw .
```

### Stow 调试技巧

```bash
# 模拟运行（不实际执行，查看会发生什么）
stow -n fish

# 详细输出（查看操作过程）
stow -v fish

# 非常详细的输出（调试用）
stow -vv fish

# 检查 stow 版本
stow --version

# 查看 stow 帮助
stow --help
```

## 🛠 高级配置

### 自定义缩写

编辑 `~/.config/fish/conf.d/abbreviations.fish`:

```fish
# 添加自定义缩写
abbr -a myalias 'your command here'
```

### 自定义 Starship 主题

编辑 `~/.config/starship.toml`，参考 [Starship 官方文档](https://starship.rs/config/)

### Fish 插件管理

使用 Fisher 管理插件：

```bash
# 安装 Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# 安装推荐插件
fisher install PatrickF1/fzf.fish
fisher install franciscolourenco/done
```

## 📝 快速参考

### Stow 常用命令速查

| 命令 | 说明 |
|------|------|
| `stow fish` | 部署 Fish 配置 |
| `stow -D fish` | 取消部署 Fish 配置 |
| `stow -R fish` | 重新部署 Fish 配置 |
| `stow -n fish` | 模拟运行（不实际执行） |
| `stow -v fish` | 详细输出 |
| `stow fish starship vscode` | 同时部署多个配置 |
| `stow */` | 部署所有配置 |

### 配置文件位置速查

| 工具 | 配置文件位置 |
|------|-------------|
| Fish | `~/.config/fish/config.fish` |
| Starship | `~/.config/starship.toml` |
| Ghostty | `~/.config/ghostty/config` |
| Kitty | `~/.config/kitty/kitty.conf` |
| WezTerm | `~/.config/wezterm/wezterm.lua` |
| Neovim | `~/.config/nvim/init.lua` |
| VSCode | `~/Library/Application Support/Code/User/settings.json` |
| Tmux | `~/.tmux.conf` |
| Bat | `~/.config/bat/config` |

### 字体配置速查

所有工具当前统一使用：**LigaMonaco Nerd Font**

| 工具 | 字号 |
|------|------|
| Ghostty | 16pt |
| Kitty | 16pt |
| WezTerm | 16pt |
| VSCode 编辑器 | 14pt |
| VSCode 终端 | 14pt |

## 📚 更多资源

- [Fish Shell 文档](https://fishshell.com/docs/current/)
- [Starship 配置指南](https://starship.rs/config/)
- [GNU Stow 手册](https://www.gnu.org/software/stow/manual/stow.html)
- [Nerd Fonts](https://nerdfonts.com/)
- [Ghostty 文档](https://ghostty.org/docs)
- [Kitty 文档](https://sw.kovidgoyal.net/kitty/)
- [WezTerm 文档](https://wezfurlong.org/wezterm/)
- [VSCode 文档](https://code.visualstudio.com/docs)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个配置！

## 📄 许可证

MIT License

---

⚠️ **注意事项**
- 所有配置文件使用符号链接，修改后会自动同步到 dotfiles 仓库
- 建议在虚拟机中测试配置后再在主系统中使用
- 部分配置可能需要重启终端才能生效
- Fish shell 配置包含完整的缩写系统，输入缩写后按 Tab 查看展开
