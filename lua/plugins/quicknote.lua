local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd
local quicknote = require("quicknote")

quicknote.setup()

cmd("BufEnter", {
	desc = "Show note signs",
	pattern = "*",
	callback = quicknote.ShowNoteSigns,
})
