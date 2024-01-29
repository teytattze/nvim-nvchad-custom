local conform = require "conform"

conform.setup {
  lsp_fallback = true,

  formatters_by_ft = {
    css = { { "prettierd", "prettier" } },
    html = { { "prettierd", "prettier" } },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    lua = { "stylua" },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = true,
  },
}
