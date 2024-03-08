local lspconfig = require "lspconfig"
local plugins_configs_lspconfig = require "plugins.configs.lspconfig"

local on_attach = plugins_configs_lspconfig.on_attach
local capabilities = plugins_configs_lspconfig.capabilities

local servers = { "astro", "cssls", "cssmodules_ls", "gopls", "html", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.eslint.setup {
  settings = {
    workingDirectory = {
      mode = "auto",
    },
  },
}

lspconfig.tailwindcss.setup {
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
        },
      },
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      importModuleSpecifierPreference = "shortest",
    },
  },
}
