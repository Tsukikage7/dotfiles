-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Go 开发键位映射
local map = vim.keymap.set

-- Go 专用键位 (仅在 Go 文件中生效)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- 代码生成和重构
    map("n", "<leader>gsj", "<cmd>GoAddTag json<cr>", { desc = "添加 json tag", buffer = true })
    map("n", "<leader>gsy", "<cmd>GoAddTag yaml<cr>", { desc = "添加 yaml tag", buffer = true })
    map("n", "<leader>gsr", "<cmd>GoRmTag<cr>", { desc = "移除 tag", buffer = true })
    map("n", "<leader>gsf", "<cmd>GoFillStruct<cr>", { desc = "填充结构体", buffer = true })
    map("n", "<leader>gsi", "<cmd>GoImpl<cr>", { desc = "实现接口", buffer = true })

    -- 测试
    map("n", "<leader>gt", "<cmd>GoTest<cr>", { desc = "运行测试", buffer = true })
    map("n", "<leader>gT", "<cmd>GoTestFunc<cr>", { desc = "测试当前函数", buffer = true })
    map("n", "<leader>gtf", "<cmd>GoTestFile<cr>", { desc = "测试当前文件", buffer = true })
    map("n", "<leader>gtc", "<cmd>GoCoverage<cr>", { desc = "测试覆盖率", buffer = true })

    -- 调试
    map("n", "<leader>gdb", "<cmd>GoBreakToggle<cr>", { desc = "切换断点", buffer = true })
    map("n", "<leader>gdd", "<cmd>GoDebug<cr>", { desc = "启动调试", buffer = true })

    -- 代码导航
    map("n", "<leader>gj", "<cmd>GoCodeLenAct<cr>", { desc = "执行 CodeLens", buffer = true })

    -- 运行
    map("n", "<leader>gr", "<cmd>GoRun<cr>", { desc = "运行程序", buffer = true })
    map("n", "<leader>gb", "<cmd>GoBuild<cr>", { desc = "构建程序", buffer = true })
  end,
})

-- TypeScript/JavaScript 专用键位
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  callback = function()
    -- 代码操作
    map("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { desc = "整理导入", buffer = true })
    map("n", "<leader>cO", "<cmd>TSToolsSortImports<cr>", { desc = "排序导入", buffer = true })
    map("n", "<leader>cu", "<cmd>TSToolsRemoveUnused<cr>", { desc = "移除未使用", buffer = true })
    map("n", "<leader>cD", "<cmd>TSToolsGoToSourceDefinition<cr>", { desc = "跳转源定义", buffer = true })
    map("n", "<leader>cR", "<cmd>TSToolsRenameFile<cr>", { desc = "重命名文件", buffer = true })
    map("n", "<leader>cI", "<cmd>TSToolsAddMissingImports<cr>", { desc = "添加缺失导入", buffer = true })
    map("n", "<leader>cF", "<cmd>TSToolsFixAll<cr>", { desc = "修复所有", buffer = true })
  end,
})

-- Markdown 专用键位
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Markdown 操作
    map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "切换预览", buffer = true })
    map("n", "<leader>mt", "<cmd>TableModeToggle<cr>", { desc = "切换表格模式", buffer = true })
    map("n", "<leader>mT", "<cmd>GenTocGFM<cr>", { desc = "生成 TOC", buffer = true })
  end,
})
