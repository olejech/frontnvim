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
		"markdown_inline",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "markdown" },
	},
	context_commentstring = {
		enable = true,
	},
})
