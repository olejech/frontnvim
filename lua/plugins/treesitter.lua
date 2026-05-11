require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({
	"javascript",
	"typescript",
	"tsx",
	"vimdoc",
	"lua",
	"markdown",
	"json",
	"graphql",
	"vim",
	"html",
	"css",
	"scss",
	"markdown_inline",
	"diff",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
