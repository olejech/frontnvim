local actions = require("fzf-lua").actions

require("fzf-lua").setup({
  actions = {
    files = {
      ["\\"]     = actions.file_split,
      ["|"]      = actions.file_vsplit,
      ["ctrl-q"] = actions.file_sel_to_qf,
    }
  },

})
