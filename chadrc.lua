---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.core.mappings"
M.ui = {
  theme = "catppuccin",

  transparency = true,
  lsp_semantic_tokens = true,

  nvdash = {
    load_on_startup = true,
  },
}

return M
