-- =========================================================
-- 会话管理配置
-- 禁用自动恢复，避免覆盖启动界面
-- =========================================================

return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      -- 禁用自动恢复最后会话
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "恢复会话",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "恢复上次会话",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "不保存当前会话",
      },
    },
    init = function()
      -- 禁用自动会话恢复
      -- 只有手动按 <leader>qs 才会恢复会话
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("persistence_no_autoload", { clear = true }),
        callback = function()
          -- 阻止 persistence 自动恢复
          if vim.fn.argc() == 0 then
            -- 即使无参数启动也不自动恢复
            return true
          end
        end,
        nested = true,
      })
    end,
  },
}
