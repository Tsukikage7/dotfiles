# VSCode 配置

通过 Stow 管理的 Visual Studio Code 配置文件。

## 配置文件说明

### 包含的配置

- **settings.json** - 全局编辑器设置
- **keybindings.json** - 自定义快捷键绑定
- **snippets/** - 代码片段目录

## 安装

### 使用 Stow 部署配置

```bash
cd ~/dotfiles
stow vscode
```

这会在以下位置创建符号链接：
```
~/Library/Application Support/Code/User/settings.json
~/Library/Application Support/Code/User/keybindings.json
~/Library/Application Support/Code/User/snippets/
```

### 取消部署

```bash
cd ~/dotfiles
stow -D vscode
```

## 主要配置特性

### 字体设置
- **编辑器字体**: LigaMonaco Nerd Font (14pt)
- **终端字体**: LigaMonaco Nerd Font (14pt)
- **启用连字**: 支持字体连字特性

### 编辑器行为
- ✅ 保存时自动格式化
- ✅ 粘贴时自动格式化
- ✅ 平滑滚动和光标动画
- ✅ 鼠标滚轮缩放

### 终端配置
- **默认 Shell**: Fish
- **外部终端**: Kitty
- **选中即复制**: 已启用

### Git 集成
- ✅ 智能提交（自动暂存）
- ✅ 自动获取远程更新
- ✅ 同步时跳过确认

### 代码样式
- 注释、关键词使用斜体粗体
- 函数名使用斜体
- 完整的多语言支持（Go、JavaScript、Python、Rust 等）

## 语言格式化工具

| 语言 | 格式化工具 |
|------|-----------|
| JSON | vscode.json-language-features |
| JavaScript | Prettier |
| TypeScript React | Prettier |
| Vue | Prettier |
| CSS | vscode.css-language-features |
| YAML | redhat.vscode-yaml |
| Nginx | ahmadalli.vscode-nginx-conf |

## 主题和图标

- **颜色主题**: Maple Dark
- **图标主题**: Material Icon Theme

## 修改配置

所有配置文件都位于 `~/dotfiles/vscode/Library/Application Support/Code/User/`

修改后会自动同步到 VSCode，因为使用的是符号链接。

## 备份和恢复

### 备份当前配置

如果您已有配置想要保存：

```bash
cp -r "~/Library/Application Support/Code/User/settings.json" ~/vscode-backup/
cp -r "~/Library/Application Support/Code/User/keybindings.json" ~/vscode-backup/
cp -r "~/Library/Application Support/Code/User/snippets" ~/vscode-backup/
```

### 从 dotfiles 恢复

```bash
cd ~/dotfiles
stow vscode
```

## 注意事项

⚠️ **重要提示**:
- 使用 stow 部署前，请确保备份现有配置
- VSCode 会自动应用配置更改，无需重启
- snippets 目录包含自定义代码片段
- 不要直接编辑符号链接指向的原文件

## 扩展推荐

此配置已针对以下扩展进行优化：
- Prettier
- Better Comments
- Material Icon Theme
- GitLens
- Code Runner
- 各语言支持扩展（Go、Python、Vue 等）

## 故障排除

### 配置未生效

```bash
# 检查符号链接
ls -la "~/Library/Application Support/Code/User/"

# 重新部署
cd ~/dotfiles
stow -R vscode
```

### 恢复默认配置

```bash
# 取消 stow 部署
cd ~/dotfiles
stow -D vscode

# VSCode 将使用默认配置
```
