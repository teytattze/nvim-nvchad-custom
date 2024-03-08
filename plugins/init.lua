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
    "folke/trouble.nvim",
    cmd = {
      "TroubleToggle",
    },
    opts = require "custom.plugins.configs.trouble",
  },

  {
    "hrsh7th/nvim-cmp",
    opts = require "custom.plugins.configs.cmp",
  },

  {
    "mfussenegger/nvim-jdtls",
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
    "nvim-treesitter/nvim-treesitter",
    opts = require "custom.plugins.configs.treesitter",
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require "custom.plugins.configs.nvimtree",
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    opts = require "custom.plugins.configs.telescope",
  },

  {
    "scalameta/nvim-metals",
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require "custom.plugins.configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = require "custom.plugins.configs.mason",
  },
}

return plugins
