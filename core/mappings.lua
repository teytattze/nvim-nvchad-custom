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

    -- lsp
    ["gi"] = "",
    ["<leader>ls"] = "",

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
    ["<leader>rn"] = { vim.lsp.buf.rename, "[R]e[n]ame" },

    ["<leader>ca"] = {
      vim.lsp.buf.code_action,
      "[C]ode [A]ction",
    },

    ["gD"] = {
      vim.lsp.buf.declaration,
      "[G]oto [D]eclaration",
    },

    ["gd"] = {
      "<cmd>Telescope lsp_definitions<CR>",
      "[G]oto [D]efinition",
    },

    ["gI"] = {
      "<cmd>Telescope lsp_implementations<CR>",
      "[G]oto [I]mplementation",
    },

    ["<leader>D"] = {
      "<cmd>Telescope lsp_type_definitions<CR>",
      "Type [D]efinition",
    },

    ["K"] = {
      vim.lsp.buf.hover,
      "Hover Documentation",
    },

    ["<leader>k"] = {
      vim.lsp.buf.signature_help,
      "Signature Documentation",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>wa"] = {
      vim.lsp.buf.add_workspace_folder,
      "[W]orkspace [A]dd Folder",
    },

    ["<leader>wr"] = {
      vim.lsp.buf.remove_workspace_folder,
      "[W]orkspace [R]emove Folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "[W]orkspace [L]ist Folders",
    },
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
