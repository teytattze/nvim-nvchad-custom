local M = {}

function M.start_or_attach()
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
  metals.initialize_or_attach(metals_config)
end

return M
