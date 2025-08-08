local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha", "dashboard" }

require("ibl").setup({
	whitespace = {
		remove_blankline_trail = true,
	},
	indent = {
		char = "▏",
		smart_indent_cap = true,
	},
	scope = {
		show_start = false,
		show_end = false,
	},
	exclude = {
		filetypes = exclude_ft,
		buftypes = { "terminal" },
	},
})
