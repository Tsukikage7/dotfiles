# IdeaVim 扩展设置指南

本指南详细说明如何在 GoLand/IntelliJ IDEA 中配置和使用 IdeaVim 扩展。

## 📦 扩展分类

### 1. 内置扩展 (已自动启用,无需安装)

以下扩展是 IdeaVim 内置的,配置文件中已启用,**无需额外安装**:

#### ✅ vim-surround (已启用)
快速添加/修改/删除成对符号

**用法:**
- `ys{motion}{char}` - 添加包围符号
  - 示例: `ysiw"` - 给当前单词加双引号
  - 示例: `yss(` - 给当前行加括号
- `cs{old}{new}` - 修改包围符号
  - 示例: `cs"'` - 将双引号改为单引号
  - 示例: `cs([` - 将圆括号改为方括号
- `ds{char}` - 删除包围符号
  - 示例: `ds"` - 删除双引号
  - 示例: `ds{` - 删除花括号
- `S{char}` - 在可视模式下添加包围符号

**常用符号:**
- `"` 双引号
- `'` 单引号
- `)` 圆括号(无空格)
- `(` 圆括号(带空格)
- `}` 花括号(无空格)
- `{` 花括号(带空格)
- `]` 方括号(无空格)
- `[` 方括号(带空格)
- `t` HTML/XML 标签

#### ✅ vim-commentary (已启用)
快速注释/取消注释

**用法:**
- `gcc` - 注释/取消注释当前行
- `gc{motion}` - 注释选中内容
  - 示例: `gcap` - 注释当前段落
  - 示例: `gc3j` - 注释当前行及下面 3 行
- `gc` - 在可视模式下注释选中内容

#### ✅ vim-multiple-cursors (已启用)
多光标编辑

**用法:**
- `<A-n>` (Option-n / Alt-n) - 选择下一个相同单词
- `<A-x>` (Option-x / Alt-x) - 跳过当前并选择下一个
- `<A-p>` (Option-p / Alt-p) - 取消选择并回到上一个
- `g<A-n>` - 选择所有相同单词

**使用流程:**
1. 将光标放在要编辑的单词上
2. 按 `<A-n>` 选择当前单词
3. 继续按 `<A-n>` 选择更多相同单词
4. 按 `c` 进入插入模式并同时编辑所有选中的单词
5. 按 `<Esc>` 退出多光标模式

#### ✅ highlightedyank (已启用)
复制时高亮显示

**效果:**
复制文本时会短暂高亮显示被复制的内容,持续 300ms

#### ✅ NERDTree (已启用)
文件树集成

**说明:**
在 IdeaVim 中,这会将 NERDTree 的键位映射到 IDE 的项目视图

#### ✅ exchange (已启用)
交换两个文本块

**用法:**
1. `cx{motion}` - 标记第一个交换目标
   - 示例: `cxiw` - 标记当前单词
2. 移动到另一个位置
3. `cx{motion}` - 标记第二个目标并交换
   - 示例: `cxiw` - 标记并交换
4. `cxc` - 取消标记

**示例:**
```go
// 交换两个变量名
foo := 1    // 光标在 foo 上,按 cxiw
bar := 2    // 光标在 bar 上,按 cxiw → foo 和 bar 交换
```

#### ✅ 增强文本对象 (已启用)

**argtextobj** - 参数文本对象:
- `daa` - 删除一个参数(包括逗号)
- `cia` - 修改参数内容
- `via` - 选择参数内容

**textobj-entire** - 整个文件文本对象:
- `dae` - 删除整个文件
- `yae` - 复制整个文件
- `vae` - 选择整个文件
- `cie` - 清空并编辑整个文件

**textobj-indent** - 缩进文本对象:
- `dai` - 删除当前缩进块(包括缩进)
- `cii` - 修改当前缩进块内容
- `vii` - 选择当前缩进块

#### ✅ ReplaceWithRegister (已启用)
用寄存器内容替换文本

**用法:**
1. `yy` - 复制一行到寄存器
2. 移动到要替换的位置
3. `gr{motion}` - 替换
   - 示例: `griw` - 替换当前单词
   - 示例: `gr$` - 替换到行尾
   - 示例: `grr` - 替换整行

---

### 2. 可选插件 (需要手动安装)

以下插件需要在 JetBrains Marketplace 中搜索并安装:

#### 🔧 IdeaVim-EasyMotion (推荐)
快速跳转到屏幕上的任意位置

**安装步骤:**
1. Settings/Preferences → Plugins
2. 搜索 "IdeaVim-EasyMotion"
3. 点击 Install
4. 重启 IDE
5. 在 `.ideavimrc` 中取消注释: `set easymotion`

**用法:**
- `<leader><leader>w` - 跳转到单词开头
- `<leader><leader>b` - 向后跳转到单词开头
- `<leader><leader>e` - 跳转到单词结尾
- `<leader><leader>f{char}` - 跳转到指定字符
- `<leader><leader>s{char}` - 双向搜索字符

#### 🔧 AceJump (推荐)
类似 EasyMotion,但与 IDE 集成更好

**安装步骤:**
1. Settings/Preferences → Plugins
2. 搜索 "AceJump"
3. 点击 Install
4. 重启 IDE
5. 在 `.ideavimrc` 中取消注释: `set acejump`

**用法:**
- `<leader>j` - 激活 AceJump

#### 🔧 IdeaVim-Quickscope (可选)
在 f/F/t/T 移动时高亮唯一字符

**安装步骤:**
1. Settings/Preferences → Plugins
2. 搜索 "IdeaVim-Quickscope"
3. 点击 Install
4. 重启 IDE
5. 在 `.ideavimrc` 中取消注释: `set quickscope`

---

## 🚀 快速开始

### 1. 重新加载配置

修改 `.ideavimrc` 后,在 IDE 中执行:

**方法 1: 使用命令**
1. 按 `Shift + Shift` 打开 Search Everywhere
2. 输入 "IdeaVim" 并选择 "Reload .ideavimrc"

**方法 2: 使用 Vim 命令**
1. 进入 Vim 命令模式 (`:`)
2. 输入 `:source ~/.ideavimrc`

**方法 3: 重启 IDE**
- 直接重启 GoLand/IntelliJ IDEA

### 2. 验证扩展已启用

打开任意文件,测试以下功能:

#### 测试 vim-surround:
```
1. 输入: hello
2. 光标移到 hello 上
3. 按: ysiw"
4. 结果: "hello"
```

#### 测试 vim-commentary:
```
1. 输入一行代码: fmt.Println("test")
2. 按: gcc
3. 结果: // fmt.Println("test")
```

#### 测试 multiple-cursors:
```
1. 输入多行相同单词:
   foo
   foo
   foo
2. 光标在第一个 foo 上
3. 按: <A-n> <A-n> <A-n> (选择所有 foo)
4. 按: c 进入编辑模式
5. 输入: bar
6. 按: <Esc>
7. 结果: 所有 foo 都变成 bar
```

---

## 📋 常用操作示例

### 场景 1: 给函数参数加引号

**代码:**
```go
func test(name string, age int) {
    // ...
}
```

**操作:**
1. 光标移到 `name` 上
2. 按 `ysiw"` → `"name" string`
3. 移到 `age` 上
4. 按 `ysiw"` → `"age" int`

### 场景 2: 修改引号类型

**代码:**
```go
msg := "hello world"
```

**操作:**
1. 光标移到引号内
2. 按 `cs"'` → `msg := 'hello world'`

### 场景 3: 批量重命名变量

**代码:**
```go
old := 1
fmt.Println(old)
result := old + 2
```

**操作:**
1. 光标移到第一个 `old` 上
2. 按 `<A-n>` 三次选择所有 `old`
3. 按 `c` 进入编辑模式
4. 输入 `new`
5. 按 `<Esc>`

**结果:**
```go
new := 1
fmt.Println(new)
result := new + 2
```

### 场景 4: 注释代码块

**代码:**
```go
func test() {
    line1()
    line2()
    line3()
}
```

**操作:**
1. 光标移到 `line1()` 上
2. 按 `Vjj` 选择三行
3. 按 `gc` 注释选中内容

**结果:**
```go
func test() {
    // line1()
    // line2()
    // line3()
}
```

---

## 💡 使用技巧

### 1. 组合使用扩展

**示例:** 给多个函数参数同时加引号
```go
// 原代码
func test(foo, bar, baz string) {}

// 操作流程:
1. 光标移到 foo 上
2. <A-n><A-n><A-n> (选择所有相同缩进的单词)
3. 实际上应该用 cia (修改参数) 更准确
4. ysiw" (给每个单词加引号)
```

### 2. 自定义键位映射

如果你不喜欢 `<A-n>` 的多光标快捷键,可以在 `.ideavimrc` 中重新映射:

```vim
" 使用 Ctrl-d 代替 Alt-n
map <C-d> <Plug>NextWholeOccurrence
```

### 3. 禁用不需要的扩展

如果某个扩展影响了你的使用,在 `.ideavimrc` 中注释掉对应的 `set` 命令:

```vim
" set multiple-cursors  " 禁用多光标
```

---

## 🔧 故障排除

### 问题 1: 扩展不生效

**解决方案:**
1. 确认已重新加载配置: `:source ~/.ideavimrc`
2. 检查 IdeaVim 插件是否启用: Settings → Plugins
3. 重启 IDE

### 问题 2: 多光标快捷键冲突

**解决方案:**
在 `.ideavimrc` 中重新映射:
```vim
" macOS 使用 Cmd 代替 Alt
map <D-n> <A-n>
```

### 问题 3: Surround 不工作

**解决方案:**
1. 确认配置中有 `set surround`
2. 检查是否在正常模式下操作
3. 尝试重启 IDE

---

## 📚 参考资料

- [IdeaVim 官方文档](https://github.com/JetBrains/ideavim)
- [IdeaVim 扩展列表](https://github.com/JetBrains/ideavim/wiki/IdeaVim-Plugins)
- [vim-surround 使用说明](https://github.com/tpope/vim-surround)
- [vim-commentary 使用说明](https://github.com/tpope/vim-commentary)

---

## ✅ 检查清单

使用此清单确保所有扩展都已正确配置:

- [ ] IdeaVim 插件已安装并启用
- [ ] `.ideavimrc` 文件已创建并链接
- [ ] 已重新加载配置或重启 IDE
- [ ] vim-surround 可以正常使用 (测试 `ysiw"`)
- [ ] vim-commentary 可以正常使用 (测试 `gcc`)
- [ ] multiple-cursors 可以正常使用 (测试 `<A-n>`)
- [ ] (可选) EasyMotion/AceJump 已安装并配置
- [ ] 所有键位映射都符合预期
