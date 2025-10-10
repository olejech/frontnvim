local augroup = vim.api.nvim_create_augroup
local namespace = vim.api.nvim_create_namespace
local cmd = vim.api.nvim_create_autocmd

-- auto enable/disable search highlight
vim.on_key(function(char)
	if vim.fn.mode() == "n" then
		local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
		if vim.opt.hlsearch:get() ~= new_hlsearch then
			vim.opt.hlsearch = new_hlsearch
		end
	end
end, namespace("auto_hlsearch"))

-- Hightlight yanked text
cmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("highlightyank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- set clear color for lsp hover
local set_hl_for_floating_window = function()
	vim.api.nvim_set_hl(0, "NormalFloat", {
		link = "Normal",
	})
	vim.api.nvim_set_hl(0, "FloatBorder", {
		bg = "none",
	})
end
set_hl_for_floating_window()

cmd("ColorScheme", {
	pattern = "*",
	desc = "Avoid overwritten by loading color schemes later",
	callback = set_hl_for_floating_window,
})

-- disable set comment on new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- show recording macros status
vim.cmd("autocmd RecordingEnter * set cmdheight=1")
vim.cmd("autocmd RecordingLeave * set cmdheight=0")

-- restore cursor position on yank
local function restore_cursor_on_yank()
	local cursorPreYank
	vim.keymap.set({ "n", "x" }, "y", function()
		cursorPreYank = vim.api.nvim_win_get_cursor(0)
		return "y"
	end, { expr = true })
	vim.keymap.set("n", "Y", function()
		cursorPreYank = vim.api.nvim_win_get_cursor(0)
		return "y$"
	end, { expr = true })

	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = function()
			if vim.v.event.operator == "y" and cursorPreYank then
				vim.api.nvim_win_set_cursor(0, cursorPreYank)
			end
		end,
	})
end
restore_cursor_on_yank()

-- Auto reload files when changed externally
cmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	desc = "Check if buffer changed outside of vim",
	group = augroup("auto_read", { clear = true }),
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})

-- Enable/disable autoformat
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
