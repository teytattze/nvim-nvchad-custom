local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

local nvim_jdtls_group = augroup("nvim-jdtls", { clear = true })
autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    require("custom.plugins.configs.jdtls").start_or_attach()
  end,
  group = nvim_jdtls_group,
})

local nvim_metals_group = augroup("nvim-metals", { clear = true })
autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("custom.plugins.configs.metals").start_or_attach()
  end,
  group = nvim_metals_group,
})
