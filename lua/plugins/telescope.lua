local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				prompt_position = "top",
			},
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
			},
		},
	},
	pickers = {
		lsp_definitions = {
			file_ignore_patterns = { "index.d.ts" },
		},
		find_files = {
			hidden = true,
			file_ignore_patterns = { ".git/", "index.ts", "%.lock" },
			-- no_ignore = true,
		},
		lsp_references = {
			show_line = false,
		},
		live_grep = {
			file_ignore_patterns = { ".git/", "%.lock", "%.svg" },
		},
	},
})
