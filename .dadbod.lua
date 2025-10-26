-- 数据库连接配置示例
-- 这个文件仅用于测试，实际使用时应在每个项目根目录创建

return {
  -- 本地 PostgreSQL（如果启动了本地服务）
  {
    name = "PostgreSQL 本地",
    url = "postgresql://postgres@localhost:5432/postgres?client_encoding=UTF8",
  },

  -- 远程 PostgreSQL 示例（根据您的实际情况修改）
  -- 重要：添加 client_encoding=UTF8 参数修复中文乱码
  {
    name = "远程 PostgreSQL",
    url = "postgresql://username:password@165.154.169.229:5432/dbname?client_encoding=UTF8",
  },

  -- SQLite 测试数据库
  {
    name = "SQLite 测试",
    url = "sqlite:///" .. vim.fn.getcwd() .. "/test.db",
  },
}
