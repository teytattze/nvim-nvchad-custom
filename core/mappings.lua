local M = {}

M.disabled = {
  t = {
    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  n = {
    -- general
    ["<leader>n"] = "",
    ["<leader>rn"] = "",

    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- tabuflin
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
  },
}

M.general = {
  n = {
    ["<C-Up>"] = { "<cmd>resize +2<cr>", "Increase window height" },
    ["<C-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height" },
    ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width" },
    ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Increase window width" },

    ["<leader>wd"] = { "<C-W>c", "Delete current window" },
    ["<leader>w-"] = { "<C-W>s", "Split window below" },
    ["<leader>w|"] = { "<C-W>v", "Split window right" },

    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>rn"] = { vim.lsp.buf.rename, "Rename" },
  },
}

M.tabufline = {
  n = {
    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<leader>bd"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.vim_tmux_navigator = {
  n = {
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<cr>" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<cr>" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>" },
  },
}

return M
