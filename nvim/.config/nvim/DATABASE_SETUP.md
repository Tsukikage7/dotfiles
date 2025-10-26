# 数据库连接配置指南

## 🚀 快速开始

### 1. 安装数据库客户端

根据你使用的数据库，在系统上安装对应的客户端工具：

```bash
# macOS
brew install mysql-client      # MySQL
brew install postgresql@15      # PostgreSQL
brew install sqlite3            # SQLite
brew install redis              # Redis
brew install mongosh            # MongoDB
```

### 2. 在项目中配置数据库连接

**数据库连接是项目级配置，每个项目单独设置。**

在你的项目根目录创建配置文件：

```bash
cd /path/to/your/project

# 复制示例配置（从 Neovim 配置目录）
cp ~/.config/nvim/DATABASE_CONFIG_EXAMPLE.lua .lazy.lua

# 编辑配置
nvim .lazy.lua
```

配置示例：

```lua
return {
  {
    name = "本地 MySQL",
    url = "mysql://root:password@localhost:3306/mydb",
  },
  {
    name = "PostgreSQL 开发",
    url = "postgresql://user:password@localhost:5432/devdb",
  },
}
```

**支持的配置文件名：**
- `.lazy.lua` ✅ (推荐，与 LazyVim 风格一致)
- `.dbui.lua`
- `.dadbod.lua`

### 3. 添加到项目的 .gitignore

⚠️ **重要：保护敏感信息！**

```bash
# 在项目根目录
echo ".lazy.lua" >> .gitignore
# 或
echo ".dbui.lua" >> .gitignore
```

## 📖 使用方法

### 打开数据库 UI

```vim
:DBUI        " 打开数据库 UI
:DBUIToggle  " 切换数据库 UI
```

或使用快捷键：`<leader>D`

### 基本操作

1. **连接数据库**
   - 在 DBUI 窗口中，按 `Enter` 展开数据库
   - 按 `o` 打开连接

2. **浏览表**
   - 展开 `Tables` 查看所有表
   - 按 `Enter` 查看表结构
   - 按 `<leader>S` 查看表数据（前 200 行）

3. **执行查询**
   - 按 `W` 创建新查询
   - 编写 SQL 查询
   - 保存文件（`:w`）自动执行（如果启用了自动执行）
   - 或手动执行：`<leader>S`

4. **保存查询**
   - 在查询缓冲区按 `<leader>W`
   - 输入查询名称保存
   - 保存的查询在 `Saved Queries` 下

### 常用快捷键

在 DBUI 窗口中：
- `o` / `Enter` - 展开/折叠
- `S` - 执行 SQL 查询
- `W` - 新建查询
- `R` - 重命名
- `d` - 删除
- `q` - 关闭 DBUI

在查询缓冲区：
- `<leader>S` - 执行查询
- `<leader>W` - 保存查询
- `<C-n>` / `<C-p>` - SQL 补全

## 🎯 高级功能

### SQL 自动补全

在 SQL 文件中会自动启用补全功能：
- 表名补全
- 列名补全
- SQL 关键字补全

### 查询结果操作

- 结果以表格形式显示
- 支持大数据量查询
- 可导出结果

### 多数据库支持

支持的数据库：
- ✅ MySQL / MariaDB
- ✅ PostgreSQL
- ✅ SQLite
- ✅ MongoDB
- ✅ Redis
- ✅ Microsoft SQL Server
- ✅ Oracle
- ✅ Snowflake
- ✅ DuckDB
- ✅ ClickHouse

## 💡 最佳实践

1. **安全性**
   - ✅ **每个项目独立配置**，不在 Neovim 全局配置中写死
   - ✅ **添加到 .gitignore**：`.lazy.lua`、`.dbui.lua` 等
   - ✅ **使用环境变量**存储敏感信息：
     ```lua
     {
       name = "生产数据库",
       url = os.getenv("DATABASE_URL"),
     }
     ```
   - ✅ 为生产数据库使用只读账户

2. **项目配置**
   - 每个项目在根目录创建 `.lazy.lua`
   - 使用 SQLite 时用相对路径：
     ```lua
     url = "sqlite:///" .. vim.fn.getcwd() .. "/data/app.db"
     ```
   - 团队协作时提供 `.lazy.lua.example` 示例

3. **性能**
   - 已默认禁用自动执行：`vim.g.db_ui_execute_on_save = false`
   - 大查询前先用 `LIMIT` 测试
   - 使用查询计划分析性能

4. **组织**
   - 使用有意义的连接名称
   - 保存常用查询以便复用
   - 按环境区分：开发、测试、生产

## 🔗 URL 格式参考

```
MySQL:      mysql://[user[:password]@][host][:port]/database
PostgreSQL: postgresql://[user[:password]@][host][:port]/database
SQLite:     sqlite:///absolute/path/to/database.db
MongoDB:    mongodb://[user:password@]host[:port]/database
Redis:      redis://[user:password@]host[:port][/database]
```

## 🔄 自动加载机制

配置会在以下时机自动加载：

1. **Neovim 启动时** - 从当前目录加载
2. **切换目录时** - 使用 `:cd` 命令后自动重新加载
3. **打开项目时** - 加载成功会显示通知

**支持的配置文件优先级：**
1. `.lazy.lua` (推荐)
2. `.dbui.lua`
3. `.dadbod.lua`

## 📝 快速参考

```bash
# 1. 在项目中创建配置
cp ~/.config/nvim/DATABASE_CONFIG_EXAMPLE.lua .lazy.lua

# 2. 编辑数据库连接
nvim .lazy.lua

# 3. 添加到 .gitignore
echo ".lazy.lua" >> .gitignore

# 4. 打开 Neovim
nvim .

# 5. 打开数据库 UI
:DBUI
```

## 📚 相关资源

- [vim-dadbod 官方文档](https://github.com/tpope/vim-dadbod)
- [vim-dadbod-ui 文档](https://github.com/kristijanhusak/vim-dadbod-ui)
- [LazyVim SQL Extras](https://www.lazyvim.org/extras/lang/sql)

---

💡 **提示**：配置示例文件位于 `~/.config/nvim/DATABASE_CONFIG_EXAMPLE.lua`
