local lint = require "lint"

lint.linters_by_ft = {
  java = { "checkstyle" },
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local lint_augroup = augroup("lint", { clear = true })

autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
