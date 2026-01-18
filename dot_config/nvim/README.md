# Neovim LazyVim 配置

> 现代化的 Neovim 配置，支持 Go、TypeScript/JavaScript、Markdown 开发

## 📦 已配置的语言支持

- ✅ **Go** - 完整的 Go 开发环境
- ✅ **TypeScript/JavaScript** - 现代前端开发
- ✅ **Markdown** - 文档编写增强

## 🎨 主题

- **Nord** - 优雅的冷色调主题

## 🚀 快速开始

### 安装验证

```bash
nvim
```

首次启动会自动安装所有插件和工具（需要 2-3 分钟）。

### 检查健康状态

```vim
:checkhealth        " 检查所有
:checkhealth go     " 检查 Go
:checkhealth node   " 检查 Node.js
```

## ⌨️ 通用键位映射

> `<leader>` 键为 **空格键**

### 基础操作
| 键位 | 功能 | 说明 |
|------|------|------|
| `<leader>?` | 显示所有键位 | 快速查看可用命令 |
| `<leader>e` | 文件树 | 切换文件浏览器 |
| `<leader>ff` | 查找文件 | Telescope 查找 |
| `<leader>fg` | 全局搜索 | Telescope grep |
| `<leader>fb` | 查找缓冲区 | 已打开的文件 |

### 窗口管理
| 键位 | 功能 |
|------|------|
| `<C-h/j/k/l>` | 切换窗口 |
| `<leader>w` | 窗口操作前缀 |
| `<leader>-` | 水平分割 |
| `<leader>|` | 垂直分割 |

### LSP 功能
| 键位 | 功能 |
|------|------|
| `gd` | 跳转定义 |
| `gr` | 查找引用 |
| `gi` | 跳转实现 |
| `K` | 显示文档 |
| `<leader>ca` | 代码操作 |
| `<leader>cr` | 重命名 |
| `<leader>cf` | 格式化 |

## 🐹 Go 开发

### 功能特性
- ✅ gopls LSP 支持
- ✅ 自动格式化（gofumpt）
- ✅ 自动导入整理
- ✅ 结构体标签管理
- ✅ 接口实现生成
- ✅ Delve 调试支持
- ✅ 测试集成

### 键位映射

#### 代码生成 (`<leader>gs`)
| 键位 | 功能 |
|------|------|
| `<leader>gsj` | 添加 json tag |
| `<leader>gsy` | 添加 yaml tag |
| `<leader>gsr` | 移除 tag |
| `<leader>gsf` | 填充结构体 |
| `<leader>gsi` | 实现接口 |

#### 测试 (`<leader>gt`)
| 键位 | 功能 |
|------|------|
| `<leader>gt` | 运行所有测试 |
| `<leader>gT` | 测试当前函数 |
| `<leader>gtf` | 测试当前文件 |
| `<leader>gtc` | 测试覆盖率 |

#### 运行与调试
| 键位 | 功能 |
|------|------|
| `<leader>gr` | 运行程序 |
| `<leader>gb` | 构建程序 |
| `<leader>gdb` | 切换断点 |
| `<leader>gdd` | 启动调试 |

### 示例工作流

```go
// 1. 定义结构体
type User struct {
    Name string
    Age  int
}

// 2. 光标放在 User 上，按 <leader>gsj 添加 json tag
type User struct {
    Name string `json:"name"`
    Age  int    `json:"age"`
}

// 3. 保存时自动格式化和整理导入
```

## 💻 TypeScript/JavaScript 开发

### 功能特性
- ✅ TypeScript Language Server
- ✅ ESLint 集成
- ✅ Prettier 格式化
- ✅ 自动导入管理
- ✅ Inlay Hints（类型提示）
- ✅ Jest/Vitest 测试支持
- ✅ DAP 调试支持
- ✅ package.json 智能提示

### 键位映射 (`<leader>c`)
| 键位 | 功能 |
|------|------|
| `<leader>co` | 整理导入 |
| `<leader>cO` | 排序导入 |
| `<leader>cu` | 移除未使用的导入 |
| `<leader>cD` | 跳转源定义 |
| `<leader>cR` | 重命名文件 |
| `<leader>cI` | 添加缺失导入 |
| `<leader>cF` | 修复所有问题 |

### package.json 操作 (`<leader>n`)
| 键位 | 功能 |
|------|------|
| `<leader>ns` | 显示包信息 |
| `<leader>nt` | 切换包信息 |
| `<leader>nu` | 更新包 |
| `<leader>nd` | 删除包 |
| `<leader>ni` | 安装包 |
| `<leader>np` | 修改包版本 |

### 支持的文件类型
- `.ts` - TypeScript
- `.tsx` - TypeScript React
- `.js` - JavaScript
- `.jsx` - JavaScript React
- `.vue` - Vue 单文件组件

## 📝 Markdown 编写

### 功能特性
- ✅ 实时预览（浏览器）
- ✅ 表格模式
- ✅ TOC 生成
- ✅ marksman LSP
- ✅ 语法高亮
- ✅ Prettier 格式化

### 键位映射 (`<leader>m`)
| 键位 | 功能 |
|------|------|
| `<leader>mp` | 切换浏览器预览 |
| `<leader>mt` | 切换表格模式 |
| `<leader>mT` | 生成 TOC 目录 |

### 表格模式使用

1. 开启表格模式：`<leader>mt`
2. 输入表格：
```markdown
| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |
```
3. 表格会自动对齐格式化

## 🔧 插件管理

### Lazy.nvim 命令

```vim
:Lazy              " 打开插件管理器
:Lazy sync         " 同步/更新插件
:Lazy clean        " 清理未使用的插件
:Lazy profile      " 查看插件加载时间
```

### Mason 工具管理

```vim
:Mason             " 打开工具管理器
:MasonUpdate       " 更新所有工具
:MasonInstall <tool>  " 安装工具
```

### 已安装的工具

#### Go
- gopls
- goimports
- gofumpt
- gomodifytags
- impl
- delve

#### TypeScript/JavaScript
- typescript-language-server
- eslint-lsp
- prettier
- prettierd
- eslint_d
- js-debug-adapter

#### Markdown
- marksman
- markdownlint
- prettier

## 🎯 常用命令速查

### 编辑器操作
```vim
:w                 " 保存
:q                 " 退出
:wq                " 保存并退出
:qa                " 退出所有
```

### 搜索与导航
```vim
/pattern           " 向下搜索
?pattern           " 向上搜索
n                  " 下一个匹配
N                  " 上一个匹配
*                  " 搜索当前单词
```

### 代码折叠
```vim
za                 " 切换折叠
zM                 " 折叠所有
zR                 " 展开所有
```

## 📁 配置结构

```
~/.config/nvim/
├── init.lua                    # 入口文件
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # 自动命令
│   │   ├── keymaps.lua        # 键位映射
│   │   ├── lazy.lua           # 插件管理器配置
│   │   └── options.lua        # 编辑器选项
│   └── plugins/
│       ├── colorscheme.lua    # Nord 主题
│       ├── go.lua             # Go 开发配置
│       ├── typescript.lua     # TS/JS 开发配置
│       └── markdown.lua       # Markdown 配置
├── GO_SETUP.md                # Go 详细文档
└── README.md                  # 本文件
```

## 🛠️ 故障排除

### 插件未加载

```vim
:Lazy sync         " 同步插件
:Lazy clean        " 清理并重新安装
```

### LSP 未启动

```vim
:LspInfo           " 查看 LSP 状态
:LspRestart        " 重启 LSP
```

### 工具未安装

```vim
:Mason             " 打开 Mason
" 按 'i' 手动安装工具
```

### Go 工具问题

```vim
:GoInstallBinaries " 重新安装 Go 工具
```

### 格式化不工作

```vim
:ConformInfo       " 查看格式化器状态
```

## 💡 使用建议

### 1. 学习曲线
- 先熟悉基础的 Vim 操作（hjkl、i/a/o、v 等）
- 记住 `<leader>` = 空格，这是大部分操作的入口
- 使用 `<leader>?` 查看所有可用键位

### 2. 高效工作流
- 使用 `<leader>ff` 快速跳转文件
- 使用 `<leader>fg` 全局搜索内容
- 保存时自动格式化，无需手动执行

### 3. 代码导航
- `gd` 跳转定义是最常用的操作
- `<C-o>` 返回上一个位置
- `<C-i>` 前进到下一个位置

### 4. 调试技巧
- 使用 `:checkhealth` 检查环境
- 使用 `:LspInfo` 查看 LSP 状态
- 使用 `:messages` 查看错误信息

## 📚 扩展学习资源

- [LazyVim 官方文档](https://www.lazyvim.org/)
- [Neovim 官方文档](https://neovim.io/doc/)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [go.nvim 文档](https://github.com/ray-x/go.nvim)
- [typescript-tools 文档](https://github.com/pmizio/typescript-tools.nvim)

## 🎓 快速入门教程

如果你是 Vim 新手，强烈建议先运行 Vim 内置教程：

```bash
vimtutor
```

或在 Neovim 中：

```vim
:Tutor
```

---

**配置完成！开始享受现代化的 Neovim 开发体验吧！** 🎉
