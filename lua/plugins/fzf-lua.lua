local actions = require("fzf-lua").actions
local fzf = require("fzf-lua")
require("fzf-lua-frecency").setup({
	cwd_only = true,
})

fzf.setup({
	"hide",
	defaults = {
		file_icons = "mini",
		formatter = "path.filename_first",
	},
	files = {
		-- fzf_opts = {
		-- 	["--exact"] = true,
		-- },
		fd_opts = [[--color=never --type f --type l --exclude .git]],
		actions = {
			["ctrl-h"] = { actions.toggle_hidden },
		},
		prompt = "❯ ",
		cwd_prompt = false,
		hidden = false,
		winopts = { fullscreen = true },
	},
	grep = {
		rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob '!*-lock.*' --glob '!*.svg' -e ]],
		winopts = { fullscreen = true },
	},
	keymap = {
		builtin = {
			true,
			["<C-d>"] = "preview-page-down",
			["<C-u>"] = "preview-page-up",
		},
		fzf = {
			true,
			["ctrl-d"] = "preview-page-down",
			["ctrl-u"] = "preview-page-up",
			["ctrl-q"] = "select-all+accept",
		},
	},
	actions = {
		files = {
			["enter"] = actions.file_edit_or_qf,
			["ctrl-s"] = actions.file_split,
			["ctrl-v"] = actions.file_vsplit,
			["ctrl-t"] = actions.file_tabedit,
			["ctrl-e"] = actions.file_sel_to_qf,
		},
	},
	lsp = {
		winopts = { fullscreen = true },
		code_actions = {
			winopts = {
				width = 0.3,
				height = 0.3,
			},
		},
	},
	buffers = {
		winopts = { fullscreen = true, sort_lastused = true },
	},
	git = {
		commits = {
			winopts = { fullscreen = true, sort_lastused = true },
			cmd = [[git log --color --pretty=format:"%C(yellow)%h%Creset ]]
				.. [[%Cgreen(%cd)%Creset %s %C(blue)<%an>%Creset" --date=format:'%d-%m-%y' {file}]],
		},
		bcommits = {
			winopts = { fullscreen = true, sort_lastused = true },
			cmd = [[git log --color --pretty=format:"%C(yellow)%h%Creset ]]
				.. [[%Cgreen(%cd)%Creset %s %C(blue)<%an>%Creset" --date=format:'%d-%m-%y' {file}]],
		},
	},
})

fzf.register_ui_select()
