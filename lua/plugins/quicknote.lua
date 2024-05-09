local cmd = vim.api.nvim_create_autocmd
local quicknote = require("quicknote")

quicknote.setup({
  git_branch_recognizable = false,
})

cmd("BufEnter", {
  desc = "Show note signs",
  pattern = "*",
  callback = quicknote.ShowNoteSigns,
})
