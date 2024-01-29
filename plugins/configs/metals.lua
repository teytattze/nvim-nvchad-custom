local metals = require "metals"
local metals_config = require("metals").bare_config()
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

metals_config.capabilities = capabilities
metals_config.on_attach = on_attach
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {},
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local nvim_metals_group = augroup("nvim-metals", { clear = true })
autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    metals.initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
