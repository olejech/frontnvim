require 'nordic'.setup({
  telescope = {
    style = 'classic',
  },
  on_highlight = function(highlights, palette)
    highlights.NeoTreeGitModified = { fg = palette.orange.base }
    highlights.NeoTreeGitUntracked = { fg = palette.green.base }
  end,
})

vim.cmd.colorscheme 'nordic'
