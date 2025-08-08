local neocodeium = require("neocodeium")

require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
	},
	appearance = {
		-- Will be removed in a future release
		use_nvim_cmp_as_default = true,
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			markdown = { "obsidian", "obsidian_new", "obsidian_tags" },
		},
	},
	completion = {
		menu = {
			border = "rounded",
			auto_show = function(ctx)
				return ctx.mode ~= "cmdline"
			end,
			draw = {
				components = {
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						-- Optionally, you may also use the highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
		documentation = {
			window = { border = "rounded" },
		},
		list = {
			max_items = 100,
			selection = { preselect = false, auto_insert = true },
		},
		accept = { auto_brackets = { enabled = false } },
	},
	cmdline = {
		keymap = {
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		neocodeium.clear()
	end,
})
