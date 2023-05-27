require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "tsx", "vimdoc", "lua", "markdown", "json", "graphql" },
	highlight = {
		enable = true,
	},
})
