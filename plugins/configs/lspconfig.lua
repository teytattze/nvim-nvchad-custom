local lspconfig = require "lspconfig"
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = { "astro", "cssls", "gopls", "html", "tsserver" }

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
