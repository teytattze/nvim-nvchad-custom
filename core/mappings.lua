local M = {}

M.disabled = {
  i = {
    -- general
    ["<C-b>"] = "",
    ["<C-e>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },

  t = {
    -- general
    ["<C-x>"] = "",

    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  n = {
    -- general
    ["<Esc>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-s>"] = "",
    ["<C-c>"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["j"] = "",
    ["k"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<leader>b"] = "",
    ["<leader>ch"] = "",
    ["<leader>fm"] = "",

    -- comment
    ["<leader>/"] = "",

    -- lsp
    ["gD"] = "",
    ["gd"] = "",
    ["K"] = "",
    ["gi"] = "",
    ["<leader>ls"] = "",
    ["<leader>D"] = "",
    ["<leader>ra"] = "",
    ["<leader>ca"] = "",
    ["gr"] = "",
    ["<leader>lf"] = "",
    ["[d"] = "",
    ["]d"] = "",
    ["<leader>q"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",

    -- nvimtree
    ["<C-n>"] = "",
    ["<leader>e"] = "",

    -- telescope
    ["<leader>ff"] = "",
    ["<leader>fa"] = "",
    ["<leader>fw"] = "",
    ["<leader>fb"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fz"] = "",
    ["<leader>cm"] = "",
    ["<leader>gt"] = "",
    ["<leader>pt"] = "",
    ["<leader>th"] = "",
    ["<leader>ma"] = "",

    -- nvterm
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",

    -- whichkey
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",

    -- blankline
    ["<leader>cc"] = "",

    -- tabuflin
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",

    -- gitsigns
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
  },

  x = {
    -- general
    ["j"] = "",
    ["k"] = "",
    ["p"] = "",
  },

  v = {
    -- general
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<"] = "",
    [">"] = "",

    -- comment
    ["<leader>/"] = "",

    -- lsp
    ["<leader>ca"] = "",
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

    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },

    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },

  v = {
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
  },
}

local diagnostic_goto_prev = function(severity)
  local goto_prev = vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    goto_prev { severity = severity, float = { border = "rounded" } }
  end
end
local diagnostic_goto_next = function(severity)
  local goto_prev = vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    goto_prev { severity = severity, float = { border = "rounded" } }
  end
end

M.lspconfig = {
  n = {
    ["[d"] = { diagnostic_goto_prev(), "Previous diagnostic" },
    ["]d"] = { diagnostic_goto_next(), "Next diagnostic" },
    ["[e"] = { diagnostic_goto_prev "ERROR", "Previous error" },
    ["]e"] = { diagnostic_goto_next "ERROR", "Next error" },
    ["[w"] = { diagnostic_goto_prev "WARN", "Previous warning" },
    ["]w"] = { diagnostic_goto_next "WARN", "Next warning" },
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["<leader>rn"] = { vim.lsp.buf.rename, "Rename" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
    ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },

    ["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Goto definition" },
    ["gr"] = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
    ["gI"] = { "<cmd>Telescope lsp_implementations<CR>", "Goto implementation" },
    ["<leader>D"] = { "<cmd>Telescope lsp_type_definitions<CR>", "Type definition" },
    ["<leader>ds"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
    ["<leader>ws"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },

    ["K"] = { vim.lsp.buf.hover, "Hover Documentation" },
    ["<leader>k"] = { vim.lsp.buf.signature_help, "Signature Documentation" },

    ["<leader>wa"] = { vim.lsp.buf.add_workspace_folder, "Workspace add folder" },
    ["<leader>wr"] = { vim.lsp.buf.remove_workspace_folder, "Workspace remove folder" },
    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "Workspace list folders",
    },
  },
}

M.nvimtree = {
  n = {
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.telescope = {
  n = {
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },
    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
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
    ["<C-d>"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Trouble" },
    ["<leader>xw"] = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
    ["<leader>xd"] = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    ["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "LSP references" },
  },
}

M.gitsigns = {
  n = {
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },
    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    ["<leader>rh"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>ph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
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
