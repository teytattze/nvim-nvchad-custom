local conform = require "conform"

conform.setup {
  lsp_fallback = true,

  formatters_by_ft = {
    css = { { "prettierd" } },
    html = { { "prettierd" } },
    json = { { "prettierd" } },
    javascript = { { "prettierd" } },
    javascriptreact = { { "prettierd" } },
    lua = { "stylua" },
    python = { "isort", "black" },
    typescript = { { "prettierd" } },
    typescriptreact = { { "prettierd" } },
  },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return {
      timeout_ms = 3000,
      lsp_fallback = true,
    }
  end,
}
