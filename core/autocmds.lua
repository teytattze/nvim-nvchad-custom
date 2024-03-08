local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local user_command = vim.api.nvim_create_user_command

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
  pattern = { "scala", "sbt" },
  callback = function()
    require("custom.plugins.configs.metals").start_or_attach()
  end,
  group = nvim_metals_group,
})

user_command("AutoFormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

user_command("AutoFormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
