local quicknote = require("quicknote")
local smart_splits = require("smart-splits")
local gitsigns = require("gitsigns")
local obsidian = require("plugins.obsidian-nvim")
local neocodeium = require("neocodeium")
local snacks = require("snacks")

local is_fullscreen = false

vim.g.mapleader = " "

-- Custom
vim.keymap.set("n", "<leader>w", ":silent! wa<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>")
vim.keymap.set("n", "|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "\\", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>bd", ":%bd!|e#<cr>")
-- vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>")
-- vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "*", ":let @/='\\<' . expand('<cword>') . '\\>' | set hlsearch<CR>")
vim.keymap.set("n", "y<C-f>", function() -- copy relative path to file
	vim.fn.setreg("+", vim.fn.expand("%"))
end)
vim.keymap.set("n", "=s", snacks.picker.spelling)
-- vim.keymap.set("n", "L", "/[A-Z]<CR>")
-- vim.keymap.set("n", "H", "?[A-Z]<CR>")
-- vim.keymap.set("n", "<leader>df", ":windo diffthis<cr>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", ":tabprev<cr>")
vim.keymap.set("n", "<leader>be", ":bufdo e<cr>")

-- Remap default behavior (langmapper break this behavior)
vim.keymap.set("n", "/", "/", { noremap = true })
vim.keymap.set("n", ".", ".", { noremap = true })

-- Remap default annoying behavior
-- vim.keymap.set("n", "x", '"_x')
-- vim.keymap.set("n", "dd", function()
-- 	if vim.fn.getline(".") == "" then
-- 		return '"_dd'
-- 	end
-- 	return "dd"
-- end, { expr = true })

-- Picker
vim.keymap.set("n", "<leader>ff", function()
	snacks.picker.smart({
		multi = { "buffers", "files" },
	})
end)
vim.keymap.set("n", "<leader>fw", snacks.picker.grep)
vim.keymap.set("n", "<leader>fb", snacks.picker.buffers)
vim.keymap.set("n", "<leader>fc", snacks.picker.grep_word)
vim.keymap.set("n", "<leader>fr", function()
	snacks.picker.lsp_references({
		includeDeclaration = false,
	})
end)
vim.keymap.set("n", "<leader>fg", snacks.picker.git_log_file)
vim.keymap.set("n", "<leader>fl", snacks.picker.resume)
vim.keymap.set("n", "<leader>fm", snacks.picker.marks)
vim.keymap.set("n", "<leader>fh", snacks.picker.help)

-- Explorer

vim.keymap.set("n", "<leader>e", snacks.explorer.open)

-- Gitsigns
vim.keymap.set("n", "]g", function()
	gitsigns.nav_hunk("next")
end)
vim.keymap.set("n", "[g", function()
	gitsigns.nav_hunk("prev")
end)
vim.keymap.set("n", "<leader>gl", function()
	gitsigns.blame_line({ full = true })
end)
vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>gh", gitsigns.reset_hunk)
vim.keymap.set("n", "<leader>gr", gitsigns.reset_buffer)
-- vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)

-- LSP
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("i", "<C-e>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<C-\\>", "<C-w>v<C-]>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Jest
vim.keymap.set("n", "<leader>js", "<cmd>JestSingle<cr>")
vim.keymap.set("n", "<leader>ja", "<cmd>Jest<cr>")
vim.keymap.set("n", "<leader>jf", "<cmd>JestFile<cr>")

-- Resize
vim.keymap.set("n", "<C-s>k", "<cmd>resize -20<cr>")
vim.keymap.set("n", "<C-s>j", "<cmd>resize +20<cr>")
vim.keymap.set("n", "<C-s>h", function()
	smart_splits.resize_left(40)
end)
vim.keymap.set("n", "<C-s>l", function()
	smart_splits.resize_right(40)
end)

vim.keymap.set("n", "<C-s>f", function()
	if is_fullscreen then
		vim.cmd("wincmd =")
		is_fullscreen = false
	else
		vim.cmd("wincmd |")
		vim.cmd("wincmd _")
		is_fullscreen = true
	end
end)

-- Smart splits
vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)
vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)

-- Quicknote
vim.keymap.set("n", "<leader>nc", quicknote.NewNoteAtCWD)
vim.keymap.set("n", "<leader>nC", quicknote.NewNoteAtCurrentLine)
vim.keymap.set("n", "<leader>no", quicknote.OpenNoteAtCurrentLine)
vim.keymap.set("n", "<leader>nd", quicknote.DeleteNoteAtCurrentLine)
vim.keymap.set("n", "<leader>nf", function()
	snacks.picker.files({
		dirs = { ".quicknote" },
		formatters = { file = { filename_only = true } },
	})
end)
vim.keymap.set("n", "<leader>nf", function()
	snacks.picker.files({
		dirs = { ".quicknote" },
		formatters = { file = { filename_only = true } },
	})
end)
vim.keymap.set("n", "<leader>nn", function()
	vim.system({ "fd", "-t", "f", "quicknote.md", ".quicknote" }, { text = true }, function(obj)
		local path = vim.split(obj.stdout, "\n", { trimempty = true })[1]
		if path then
			vim.schedule(function()
				vim.cmd.edit(path)
			end)
		end
	end)
end)

vim.keymap.set("n", "]n", quicknote.JumpToNextNote)
vim.keymap.set("n", "[n", quicknote.JumpToPreviousNote)
vim.keymap.set("n", "<leader>nt", quicknote.ToggleNoteSigns)

-- Codeium
vim.keymap.set("i", "<C-c><cr>", neocodeium.accept)
vim.keymap.set("i", "<C-c>p", function()
	neocodeium.cycle_or_complete(-1)
end)
vim.keymap.set("i", "<C-c>n", function()
	neocodeium.cycle_or_complete()
end)

-- Obsidian.nvim
vim.keymap.set("n", "<leader>zf", "<cmd>Obsidian quick_switch<cr>")
vim.keymap.set("n", "<leader>zw", "<cmd>Obsidian search<cr>")
vim.keymap.set("n", "<leader>zd", "<cmd>Obsidian follow_link<cr>")
vim.keymap.set("n", "<leader>z|", ":vsplit<cr> :Obsidian follow_link<cr>")
vim.keymap.set("n", "<leader>zc", obsidian.createNoteWithDefaultTemplate)
vim.keymap.set("n", "<leader>zC", obsidian.createAnkiNoteWithDefaultTemplate)
vim.keymap.set("n", "<leader>zb", "<cmd>Obsidian backlinks<cr>")
vim.keymap.set("x", "<leader>zl", "<cmd>Obsidian link<cr>")
vim.keymap.set("n", "<leader>zt", "<cmd>Obsidian tags<cr>")

-- Logsitter
vim.keymap.set("n", "<leader>ll", require("logsitter").log)
vim.keymap.set("n", "<leader>lc", require("logsitter").clear_buf)
