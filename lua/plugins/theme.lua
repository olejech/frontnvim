require 'nordic'.setup({
  telescope = {
    style = 'classic',
  },
  on_highlight = function(highlights, palette)
    highlights.NeoTreeGitModified = { fg = palette.orange.base }
    highlights.NeoTreeGitUntracked = { fg = palette.green.base }
    highlights.Visual = { bg = palette.gray2 }
    highlights["@markup.raw.markdown_inline"] = { bg = palette.gray3 }
  end,
  on_palette = function(palette)
    palette.cyan.base = palette.magenta.base
  end
})

vim.cmd.colorscheme 'nordic'
