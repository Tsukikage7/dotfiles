-- =========================================================
-- Go 开发环境配置
-- 使用 LazyVim 官方 extras + 社区最佳实践
-- 参考: https://www.lazyvim.org/extras/lang/go
-- 注意: extras 已在 lazy.lua 中导入
-- =========================================================

return {
  -- 额外的 Go 工具插件 (社区推荐)
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
    },
    config = function()
      require("go").setup({
        -- 禁用 LSP 配置（LazyVim 已配置）
        lsp_cfg = false,
        lsp_gofumpt = true,
        lsp_on_attach = false,

        -- Go 工具
        go = "go",
        goimports = "gopls",
        gofmt = "gofumpt",
        fillstruct = "gopls",

        -- 测试配置
        run_in_floaterm = true,

        -- 图标
        icons = { breakpoint = "🔴", currentpos = "🟢" },

        -- 集成
        trouble = true,
        luasnip = true,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- 保存时自动组织 imports
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                test = true,
                tidy = true,
              },
              analyses = {
                unusedparams = true,
                shadow = false,
              },
              staticcheck = true,
            },
          },
        },
      },
      setup = {
        gopls = function()
          -- 保存时自动组织 imports
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              local params = vim.lsp.util.make_range_params()
              params.context = { only = { "source.organizeImports" } }
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
              for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                  end
                end
              end
            end,
          })
        end,
      },
    },
  },
}
