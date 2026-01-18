# Neovim Go 开发环境配置

## 📦 已安装的插件

### 核心插件
- **go.nvim** - Go 语言增强插件
- **nvim-lspconfig** - LSP 配置（gopls）
- **nvim-treesitter** - 语法高亮和解析
- **nvim-dap** + **nvim-dap-go** - 调试支持
- **neotest** + **neotest-go** - 测试支持

### 自动安装的工具（通过 Mason）
- `gopls` - Go 语言服务器
- `goimports` - 导入管理
- `gofumpt` - 代码格式化
- `gomodifytags` - 结构体标签管理
- `impl` - 接口实现生成
- `delve` - Go 调试器

## 🎯 功能特性

### 1. 代码智能
- ✅ 自动补全
- ✅ 代码跳转（定义、引用、实现）
- ✅ 悬停文档
- ✅ 代码提示（inlay hints）
- ✅ 语义高亮

### 2. 代码格式化
- ✅ 保存时自动格式化（gofumpt）
- ✅ 自动导入整理（goimports）
- ✅ 自动移除未使用的导入

### 3. 代码生成
- ✅ 结构体标签自动生成（json、yaml）
- ✅ 接口实现自动生成
- ✅ 结构体字段自动填充

### 4. 测试支持
- ✅ 运行测试
- ✅ 测试覆盖率
- ✅ 单个函数测试
- ✅ 文件测试

### 5. 调试支持
- ✅ 断点调试
- ✅ 变量检查
- ✅ 步进/步出/继续

## ⌨️ 键位映射

> 前提：`<leader>` 键默认为空格键

### 代码生成 (`<leader>gs`)
| 键位 | 功能 | 说明 |
|------|------|------|
| `<leader>gsj` | 添加 json tag | 为结构体字段添加 json 标签 |
| `<leader>gsy` | 添加 yaml tag | 为结构体字段添加 yaml 标签 |
| `<leader>gsr` | 移除 tag | 移除结构体字段标签 |
| `<leader>gsf` | 填充结构体 | 自动填充结构体字段 |
| `<leader>gsi` | 实现接口 | 自动生成接口实现 |

### 测试 (`<leader>gt`)
| 键位 | 功能 | 说明 |
|------|------|------|
| `<leader>gt` | 运行测试 | 运行所有测试 |
| `<leader>gT` | 测试当前函数 | 运行光标所在函数的测试 |
| `<leader>gtf` | 测试当前文件 | 运行当前文件的所有测试 |
| `<leader>gtc` | 测试覆盖率 | 显示测试覆盖率 |

### 调试 (`<leader>gd`)
| 键位 | 功能 | 说明 |
|------|------|------|
| `<leader>gdb` | 切换断点 | 在当前行添加/删除断点 |
| `<leader>gdd` | 启动调试 | 启动调试会话 |

### 运行 (`<leader>g`)
| 键位 | 功能 | 说明 |
|------|------|------|
| `<leader>gr` | 运行程序 | 运行当前 Go 程序 |
| `<leader>gb` | 构建程序 | 构建当前 Go 程序 |

### 代码导航
| 键位 | 功能 | 说明 |
|------|------|------|
| `<leader>gj` | 执行 CodeLens | 执行当前 CodeLens 操作 |
| `gd` | 跳转到定义 | LSP 默认功能 |
| `gr` | 查找引用 | LSP 默认功能 |
| `K` | 悬停文档 | LSP 默认功能 |

## 🚀 使用示例

### 示例 1：添加 JSON 标签
```go
// 光标放在结构体上，按 <leader>gsj
type User struct {
    Name string
    Age  int
}

// 结果：
type User struct {
    Name string `json:"name"`
    Age  int    `json:"age"`
}
```

### 示例 2：实现接口
```go
// 光标放在类型声明上，按 <leader>gsi，输入接口名
type MyHandler struct{}

// 选择接口：http.Handler
// 自动生成：
func (m *MyHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
    panic("not implemented")
}
```

### 示例 3：运行测试
```go
// 在测试文件中，按 <leader>gt 运行所有测试
// 或按 <leader>gT 只运行当前函数的测试
func TestMyFunction(t *testing.T) {
    // test code
}
```

## 🔧 LSP 配置详情

### gopls 配置
- ✅ **gofumpt** - 更严格的代码格式化
- ✅ **静态检查** - 代码静态分析
- ✅ **代码提示** - 丰富的代码提示
- ✅ **CodeLens** - 内联操作提示
- ✅ **语义分析** - 未使用参数、写入检测等

### 启用的分析器
- `fieldalignment` - 结构体字段对齐优化
- `nilness` - nil 值检测
- `unusedparams` - 未使用参数检测
- `unusedwrite` - 未使用写入检测
- `useany` - 使用 any 替代 interface{}

## 📋 首次使用步骤

### 1. 打开 Neovim
```bash
nvim
```

### 2. 等待插件安装
首次启动会自动安装所有插件和工具，可能需要几分钟。

### 3. 验证安装
在 Neovim 中执行：
```vim
:Mason          " 查看已安装的工具
:LspInfo        " 查看 LSP 状态
:GoInstallBinaries  " 安装 Go 工具（如果需要）
```

### 4. 打开 Go 文件测试
```bash
nvim main.go
```

## 🛠️ 故障排除

### gopls 未启动
```vim
:LspInfo        " 检查 LSP 状态
:LspRestart     " 重启 LSP
```

### Go 工具未安装
```vim
:Mason          " 打开 Mason
" 然后按 'i' 安装工具
```

### 重新安装 Go 工具
```vim
:GoInstallBinaries
```

## 📚 更多资源

- [go.nvim 文档](https://github.com/ray-x/go.nvim)
- [gopls 文档](https://github.com/golang/tools/tree/master/gopls)
- [LazyVim 文档](https://www.lazyvim.org/)

## 💡 提示

1. **首次打开 Go 文件时**，gopls 会索引整个项目，可能需要一些时间
2. **保存时自动格式化**已启用，无需手动执行
3. **使用 `<leader>` 键**（空格）+ 操作快捷键即可快速执行操作
4. **按 `<leader>?`** 查看所有可用的键位映射
