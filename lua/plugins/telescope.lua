local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

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
				["<C-k>"] = lga_actions.quote_prompt(),
				["|"] = actions.select_vertical,
			},
			n = {
				["|"] = actions.select_vertical,
				["\\"] = actions.select_horizontal,
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
