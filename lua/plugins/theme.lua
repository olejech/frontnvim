local palette = require 'nordic.colors'

require 'nordic'.setup({
  telescope = {
    style = 'classic',
  },
  override = {
    NeoTreeGitModified = { fg = palette.orange.base },
    NeoTreeGitUntracked = { fg = palette.green.base },
  },
})

vim.cmd.colorscheme 'nordic'
