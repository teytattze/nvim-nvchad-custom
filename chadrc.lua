---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.core.mappings"
M.ui = {
  theme = "everblush",
  theme_toggle = {},

  tranparency = false,
  lsp_semantic_tokens = true,

  nvdash = {
    load_on_startup = true,
  },
}

return M
