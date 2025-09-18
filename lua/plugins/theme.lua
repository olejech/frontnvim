require("nordic").setup({
	on_highlight = function(highlights, palette)
		highlights.Visual = { bg = palette.gray2 }
		highlights["@markup.raw.markdown_inline"] = { bg = palette.gray3 }
		highlights.CurSearch = { bg = palette.red.base }
		highlights.Search = { bg = palette.yellow.base, fg = palette.black0 }
		highlights.SnacksPickerGitStatusUntracked = { fg = palette.green.base }
		highlights.SnacksPickerGitStatusModified = { fg = palette.orange.base }
	end,
	on_palette = function(palette)
		palette.cyan.base = palette.magenta.base
	end,
})

vim.cmd.colorscheme("nordic")
