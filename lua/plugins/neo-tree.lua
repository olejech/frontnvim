vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
	window = {
		mappings = {
			["<space>"] = false, -- disable space until we figure out which-key disabling
			["/"] = "noop",
			["g/"] = "fuzzy_finder",
			o = "open",
			["\\"] = "open_split",
			["|"] = "open_vsplit",
		},
		position = "float",
	},
	filesystem = {
		follow_current_file = true,
	},
	hide_root_node = true,
})
