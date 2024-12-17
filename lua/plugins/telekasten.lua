local home = vim.fn.expand(os.getenv("ZETTELKASTEN_PATH"))
require("telekasten").setup({
  home = home .. "Base",
  dailies = home .. "Daily",
  templates = home .. "Templates",
  template_new_note = home .. "Templates/NoteTelekastenTemplate.md",
  sort = "modified",
  show_tags_theme = "get_cursor"
})
vim.cmd [[hi tkHighlight ctermbg=214 ctermfg=124 cterm=bold guibg=#fabd2f guifg=#9d0006 gui=bold]]
vim.cmd [[hi tklink ctermfg=72 guifg=#689d6a cterm=bold,underline gui=bold,underline]]
vim.cmd [[hi tkBrackets ctermfg=gray guifg=gray]]
