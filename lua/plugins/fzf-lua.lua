local actions = require("fzf-lua").actions

require("fzf-lua").setup({
  files = {
    actions = {
      ["ctrl-h"] = { actions.toggle_hidden },
    }
  },
  keymap = {
    builtin = {
      true,
      ["<C-d>"] = "preview-page-down",
      ["<C-u>"] = "preview-page-up",
    },
    fzf = {
      true,
      ["ctrl-q"] = "select-all+accept",
    },
  },
  actions = {
    files = {
      ["ctrl-x"] = actions.file_split,
      ["ctrl-v"] = actions.file_vsplit,
      ["ctrl-t"] = actions.file_tabedit,
      ["ctrl-e"] = actions.file_sel_to_qf
    }
  },
  winopts = {
    fullscreen = true,
  },
})
