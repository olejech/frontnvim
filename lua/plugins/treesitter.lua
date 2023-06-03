require("nvim-treesitter.configs").setup({
	ensure_installed = {
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
	},
	highlight = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
})
