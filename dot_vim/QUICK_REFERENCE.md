# Vim 扩展快速参考卡片

一张纸掌握所有 Vim 扩展!

---

## 🎯 vim-surround (包围符号)

| 操作 | 快捷键 | 说明 | 示例 |
|------|--------|------|------|
| 添加 | `ys{motion}{char}` | 添加包围符号 | `ysiw"` → `"word"` |
| 修改 | `cs{old}{new}` | 修改包围符号 | `cs"'` → `'word'` |
| 删除 | `ds{char}` | 删除包围符号 | `ds"` → `word` |
| 可视 | `S{char}` | 可视模式添加 | 选中后 `S(` → `(word)` |

**常用符号:** `"` `'` `(` `)` `{` `}` `[` `]` `<` `>` `t` (HTML标签)

**记忆:** **y**ou **s**urround, **c**hange **s**urround, **d**elete **s**urround

---

## 💬 vim-commentary (注释)

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 切换行 | `gcc` | 注释/取消注释当前行 |
| 切换块 | `gc{motion}` | 注释选中内容 |
| 段落 | `gcap` | 注释当前段落 |
| 多行 | `gc3j` | 注释当前行+下3行 |
| 可视 | `gc` | 可视模式下注释 |

**记忆:** **g**o **c**omment, **g**o **c**omment **c**urrent line

---

## 🎯 multiple-cursors (多光标)

| 操作 | 快捷键 (macOS) | 说明 |
|------|----------------|------|
| 选择下一个 | `⌥-n` | 选择下一个相同单词 |
| 跳过 | `⌥-x` | 跳过当前,选择下一个 |
| 取消 | `⌥-p` | 取消当前,回到上一个 |
| 全选 | `g⌥-n` | 选择所有相同单词 |

**使用流程:**
1. 光标在单词上 → `⌥-n` 选择
2. 继续 `⌥-n` 选择更多
3. `c` 进入编辑模式
4. 输入新内容
5. `Esc` 完成编辑

**记忆:** Option + **n**ext, Option + skip(**x**), Option + **p**revious

---

## 🔄 exchange (交换文本)

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 标记1 | `cx{motion}` | 标记第一个目标 |
| 交换 | `cx{motion}` | 标记第二个并交换 |
| 取消 | `cxc` | 取消标记 |

**示例:** `cxiw` (单词1) → 移动 → `cxiw` (单词2) → 交换

**记忆:** **c**hange e**x**change

---

## 📦 增强文本对象

### argtextobj (参数)
| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 删除参数 | `daa` | 删除一个参数(含逗号) |
| 修改参数 | `cia` | 修改参数内容 |
| 选择参数 | `via` | 选择参数内容 |

**记忆:** **a**rgument

### textobj-entire (整个文件)
| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 选择全文 | `vae` | 选择整个文件 |
| 复制全文 | `yae` | 复制整个文件 |
| 删除全文 | `dae` | 删除整个文件 |
| 修改全文 | `cie` | 清空并编辑 |

**记忆:** **e**ntire file

### textobj-indent (缩进块)
| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 删除块 | `dai` | 删除当前缩进块 |
| 修改块 | `cii` | 修改缩进块内容 |
| 选择块 | `vii` | 选择缩进块 |

**记忆:** **i**ndent

---

## 📝 ReplaceWithRegister (替换)

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 替换 | `gr{motion}` | 用寄存器内容替换 |
| 替换单词 | `griw` | 替换当前单词 |
| 替换到行尾 | `gr$` | 替换到行尾 |
| 替换整行 | `grr` | 替换整行 |

**使用流程:**
1. `yy` 复制一行
2. 移动到要替换的位置
3. `gr{motion}` 替换

**记忆:** **g**o **r**eplace

---

## 🎨 highlightedyank (复制高亮)

| 操作 | 效果 |
|------|------|
| `y{motion}` | 复制时高亮显示 (300ms) |

自动生效,无需额外操作。

---

## 🚀 可选插件 (需安装)

### IdeaVim-EasyMotion
| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 跳转单词 | `<leader><leader>w` | 跳转到单词 |
| 向后跳 | `<leader><leader>b` | 向后跳转 |
| 跳字符 | `<leader><leader>f{char}` | 跳转到字符 |
| 双向搜索 | `<leader><leader>s{char}` | 双向搜索 |

### AceJump
| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 激活 | `<leader>j` | 激活 AceJump |

---

## 💡 组合技巧

### 1. 给多个参数加引号
```vim
函数: func(foo, bar, baz)
1. 光标移到 foo
2. ⌥-n ⌥-n ⌥-n (选择所有参数)
3. S" (添加双引号)
结果: func("foo", "bar", "baz")
```

### 2. 批量注释代码块
```vim
1. V 进入行可视模式
2. jjj 选择4行
3. gc 注释
```

### 3. 交换函数参数
```vim
函数: func(first, second)
1. 光标在 first,按 cxiw
2. 移到 second,按 cxiw
结果: func(second, first)
```

### 4. 用寄存器批量替换
```vim
1. yiw 复制 "newName"
2. 移到旧变量,griw 替换
3. 继续移动并 griw 替换更多
```

---

## 📌 快速测试

在 GoLand 中测试所有扩展:

```go
package main

import "fmt"

func test(foo, bar, baz string) {
    msg := "hello world"
    old := 1
    fmt.Println(old)
    result := old + 2
}
```

**测试清单:**
- [ ] `ysiw"` 给 foo 加引号 → `"foo"`
- [ ] `cs"'` 修改引号类型 → `'hello world'`
- [ ] `gcc` 注释 msg 那一行
- [ ] `⌥-n` 选择多个 old 并批量重命名
- [ ] `cxiw` 交换 foo 和 bar
- [ ] `daa` 删除一个参数
- [ ] `yy` 然后 `griw` 替换单词

---

## 🎓 记忆口诀

- **Surround:** "You Surround, Change Surround, Delete Surround"
- **Commentary:** "Go Comment Current line"
- **Multiple:** "Next, eXit, Previous"
- **Exchange:** "Change eXchange, Cancel with C"
- **Replace:** "Go Replace"
- **Text objects:** "Argument, Entire, Indent"

---

## 🔗 快速链接

- 详细设置指南: `vim/IDEAVIM_SETUP.md`
- 完整文档: `vim/README.md`
- 配置文件: `~/.ideavimrc`

**重新加载配置:** `:source ~/.ideavimrc` 或 `Shift+Shift` → "Reload .ideavimrc"
