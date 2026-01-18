# Vim 配置统一管理

这个目录包含了跨编辑器的 Vim 配置,支持 Neovim、VSCode Vim 和 GoLand IdeaVim。

## 📁 文件结构

```
vim/
├── .vimrc.shared         # 共享的基础 Vim 配置
├── .ideavimrc            # GoLand/IntelliJ IdeaVim 配置
├── vscode-vim-settings.json  # VSCode Vim 插件配置参考
└── README.md             # 本文档
```

## 🚀 快速开始

### 1. 安装所需插件

#### VSCode
安装 Vim 扩展:
```bash
code --install-extension vscodevim.vim
```

#### GoLand / IntelliJ IDEA
1. 打开 Settings/Preferences
2. 搜索 "IdeaVim"
3. 安装 IdeaVim 插件
4. 重启 IDE

### 2. 链接配置文件

使用 Stow 创建符号链接:

```bash
# 从 dotfiles 根目录执行
cd ~/dotfiles

# 链接 Vim 配置
stow vim

# 这会创建以下软链接:
# ~/.vimrc.shared -> ~/dotfiles/vim/.vimrc.shared
# ~/.ideavimrc -> ~/dotfiles/vim/.ideavimrc
```

### 3. VSCode 配置

VSCode 的 Vim 配置已经直接添加到:
```
vscode/Library/Application Support/Code/User/settings.json
```

使用 Stow 链接 VSCode 配置:
```bash
stow vscode
```

## ⌨️ 统一键位映射

### Leader 键
所有编辑器的 Leader 键都设置为 `空格键`

### 通用快捷键

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| `<leader>w` | 保存文件 | 快速保存 |
| `<leader>q` | 关闭文件 | 快速退出 |
| `<leader>ff` | 查找文件 | 文件搜索 |
| `<leader>fr` | 最近文件 | 最近打开 |
| `<leader>fs` | 跳转符号 | 符号搜索 |
| `<leader>fa` | 命令面板 | 显示所有命令 |
| `gd` | 跳转定义 | Go to Definition |
| `gi` | 跳转实现 | Go to Implementation |
| `gr` | 查找引用 | Find References |
| `gt` | 跳转类型 | Go to Type |
| `<leader>ca` | 代码操作 | Code Actions |
| `<leader>cr` | 重命名 | Rename |
| `<leader>cf` | 格式化 | Format Code |
| `<leader>co` | 整理导入 | Organize Imports |
| `<leader>sv` | 垂直分割 | Vertical Split |
| `<leader>sh` | 水平分割 | Horizontal Split |
| `<C-h/j/k/l>` | 窗口导航 | 左/下/上/右 |
| `<leader>e` | 文件树 | Toggle Sidebar |
| `<leader>T` | 终端 | Toggle Terminal |
| `H` | 行首 | 跳转到行首 |
| `L` | 行尾 | 跳转到行尾 |
| `<leader>a` | 全选 | 选择全部内容 |

### 可视模式快捷键

| 快捷键 | 功能 |
|--------|------|
| `<` | 减少缩进 |
| `>` | 增加缩进 |
| `J` | 向下移动行 |
| `K` | 向上移动行 |
| `H` | 跳转行首 |
| `L` | 跳转行尾 |

### Git 快捷键

| 快捷键 | 功能 |
|--------|------|
| `<leader>gb` | 切换分支 |
| `<leader>gc` | 提交 |
| `<leader>gp` | 推送 |
| `<leader>gl` | 查看日志 |

### GoLand 特定快捷键

| 快捷键 | 功能 |
|--------|------|
| `<leader>gt` | 运行测试 |
| `<leader>gT` | 运行文件测试 |
| `<leader>gi` | 实现接口 |
| `<leader>gs` | 生成结构体 |
| `<leader>gf` | 填充结构体 |
| `<leader>ga` | 添加标签 |

## 🎨 主题统一

所有编辑器都使用 **Gruvbox Dark Medium** 主题:
- ✅ Neovim: Gruvbox Dark
- ✅ VSCode: Gruvbox Dark Medium
- ✅ 终端: Gruvbox Dark

Vim 状态栏颜色也统一使用 Gruvbox 配色方案。

## 🔧 IdeaVim 额外功能

IdeaVim 支持以下扩展插件:

### 已启用的插件:
- **vim-surround**: 快速添加/修改/删除成对符号
  - `ys{motion}{char}`: 添加包围符号
  - `cs{old}{new}`: 修改包围符号
  - `ds{char}`: 删除包围符号

- **vim-commentary**: 快速注释
  - `gcc`: 注释当前行
  - `gc{motion}`: 注释选中内容

- **vim-easymotion**: 快速跳转
  - `<leader><leader>w`: 跳转到单词
  - `<leader><leader>f{char}`: 跳转到字符

- **vim-multiple-cursors**: 多光标编辑
  - `<C-n>`: 选择下一个相同单词

## 📝 自定义配置

### 修改共享配置
编辑 `~/.vimrc.shared` 文件,修改会自动应用到所有使用它的编辑器。

### 编辑器特定配置
- **GoLand**: 编辑 `~/.ideavimrc`
- **VSCode**: 编辑 VSCode 的 `settings.json`
- **Neovim**: 在 `nvim/.config/nvim/lua/config/keymaps.lua` 中添加

## 🔄 更新配置

修改配置文件后:

1. **GoLand/IntelliJ**:
   - 执行命令: `:source ~/.ideavimrc`
   - 或重启 IDE

2. **VSCode**:
   - 自动重载,或重启 VSCode

3. **Neovim**:
   - 执行 `:source ~/.config/nvim/init.lua`
   - 或重启 Neovim

## 💡 使用建议

1. **熟悉基础键位**: 从共享的基础键位开始,它们在所有编辑器中都可用
2. **利用 IDE 特性**: 在 GoLand/VSCode 中,Vim 模式与 IDE 功能完美结合
3. **保持一致性**: 尽量使用统一的键位映射,提升肌肉记忆
4. **按需定制**: 根据个人习惯添加自定义键位

## 🐛 故障排除

### IdeaVim 不生效
1. 确认 IdeaVim 插件已启用
2. 检查 `~/.ideavimrc` 文件是否存在
3. 重启 IDE

### VSCode Vim 延迟
已在配置中禁用 which-key 延迟,如仍有延迟:
1. 检查 `vim.leader` 设置
2. 确认没有键位冲突
3. 禁用不需要的 Vim 扩展功能

### 键位冲突
某些键位可能与 IDE 默认键位冲突,在 `vim.handleKeys` 中调整。

## 📚 参考资料

- [IdeaVim 官方文档](https://github.com/JetBrains/ideavim)
- [VSCode Vim 扩展](https://github.com/VSCodeVim/Vim)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
