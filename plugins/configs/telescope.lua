local options = {
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
      },
    },
  },
}

return options
