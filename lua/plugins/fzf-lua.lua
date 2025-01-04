local actions = require("fzf-lua").actions

require("fzf-lua").setup({
  files = {
    actions = {
      ["ctrl-h"] = { actions.toggle_hidden },
    }
  },
  keymap = {
    builtin = {
      ["<C-d>"] = "preview-page-down",
      ["<C-u>"] = "preview-page-up",
    }
  },
  winopts = {
    fullscreen = true,
  },
})
