require "custom.plugins.configs.overrides"

local plugins = {
  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
  },

  {
    "github/copilot.vim",
  },

  {
    "mfussenegger/nvim-jdtls",
    config = function()
      require "custom.plugins.configs.jdtls"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.plugins.configs.lint"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  {
    "scalameta/nvim-metals",
    config = function()
      require "custom.plugins.configs.metals"
    end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require "custom.plugins.configs.conform"
    end,
  },
}

return plugins
