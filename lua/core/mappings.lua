local quicknote = require("quicknote")
local smart_splits = require("smart-splits")
local gitsigns = require("gitsigns")
-- local builtin = require("telescope.builtin")
-- local telescope_actions = require("telescope.actions")
-- local telescope_lga_actions = require("telescope-live-grep-args.actions")
local obsidian = require("plugins.obsidian-nvim")
local neocodeium = require("neocodeium")
local fzfLua = require("fzf-lua")

local is_fullscreen = false

vim.g.mapleader = " "

-- Custom
vim.keymap.set("n", "<leader>w", ":silent! wa<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>")
vim.keymap.set("n", "|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "\\", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>bd", ":%bd!|e#<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>")
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "*", ":let @/='\\<' . expand('<cword>') . '\\>' | set hlsearch<CR>")
vim.keymap.set("n", "y<C-f>", function() -- copy relative path to file
	vim.fn.setreg("+", vim.fn.expand("%"))
end)
vim.keymap.set("n", "=s", "1z=")
vim.keymap.set("n", "L", "/[A-Z]<CR>")
vim.keymap.set("n", "H", "?[A-Z]<CR>")
vim.keymap.set("n", "<leader>df", ":windo diffthis<cr>")
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
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "dd", function()
	if vim.fn.getline(".") == "" then
		return '"_dd'
	end
	return "dd"
end, { expr = true })

-- Fzf-lua
vim.keymap.set("n", "<leader>ff", fzfLua.files)
vim.keymap.set("n", "<leader>fw", fzfLua.live_grep)
vim.keymap.set("n", "<leader>fb", fzfLua.buffers)
vim.keymap.set("n", "<leader>fc", fzfLua.grep_cword)
vim.keymap.set("n", "<leader>fr", function()
	fzfLua.lsp_references({
		includeDeclaration = false,
		-- fzf_opts = {
		-- 	["--delimiter"] = "[\\):]",
		-- 	["--with-nth"] = "1",
		-- },
	})
end)
vim.keymap.set("n", "<leader>fg", fzfLua.git_bcommits)
vim.keymap.set("n", "<leader>fl", fzfLua.resume)
vim.keymap.set("n", "<leader>fm", fzfLua.marks)
vim.keymap.set("n", "<leader>ft", fzfLua.tabs)
vim.keymap.set("n", "<leader>fh", fzfLua.helptags)

-- Telescope
-- vim.keymap.set("n", "<leader>ff", function()
-- 	require("telescope").extensions.smart_open.smart_open()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fw", require("telescope").extensions.live_grep_args.live_grep_args, {})
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fc", builtin.grep_string)
-- vim.keymap.set("n", "gr", function()
-- 	builtin.lsp_references({ include_declaration = false })
-- end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>gb", function()
-- 	builtin.git_bcommits({
-- 		use_file_path = true,
-- 		git_command = {
-- 			"git",
-- 			"log",
-- 			"--pretty=%h %s <%cn> (%cr)",
-- 			"--follow",
-- 		},
-- 	})
-- end)
-- vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope keywords=FIX<cr>")
-- vim.keymap.set("n", "<leader>fr", builtin.resume)
vim.keymap.set("n", "<leader>fn", "<cmd>:cnext<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>:cprevious<cr>")
-- local function setup_telescope_mappings()
-- 	return {
-- 		i = {
-- 			["<C-n>"] = telescope_actions.cycle_history_next,
-- 			["<C-p>"] = telescope_actions.cycle_history_prev,
-- 			["<C-k>"] = telescope_lga_actions.quote_prompt(),
-- 			["<C-e>"] = telescope_actions.send_selected_to_qflist + telescope_actions.open_qflist,
-- 		},
-- 		n = {
-- 			["<C-e>"] = telescope_actions.send_selected_to_qflist + telescope_actions.open_qflist,
-- 		},
-- 	}
-- end

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal<CR>")
local function setup_neotree_mappings()
	return {
		["<space>"] = false,
		["/"] = "noop",
		["g/"] = "fuzzy_finder",
		["<C-h>"] = "open_split",
		["<C-v>"] = "open_vsplit",
		["o"] = { "open", nowait = true },
		["oc"] = "noop",
		["od"] = "noop",
		["og"] = "noop",
		["om"] = "noop",
		["on"] = "noop",
		["os"] = "noop",
		["ot"] = "noop",
	}
end

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
vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)

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

-- Resize-fullscreen
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
-- vim.keymap.set("n", "<leader>nf", ":Telescope quicknote<cr>")
-- vim.keymap.set("n", "<leader>nn", ":Telescope quicknote<cr>quicknote")
vim.keymap.set("n", "<leader>nf", function()
	fzfLua.files({ cwd = ".quicknote" })
end)
vim.keymap.set(
	"n",
	"<leader>nn",
	":lua require('fzf-lua').files({cwd = '.quicknote', cmd = 'fd --type f --extension md', fzf_opts = { ['--query'] = 'quicknote.md' } })<cr>"
)
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
vim.keymap.set("i", "<C-c>w", function()
	neocodeium.accept_word()
end)
vim.keymap.set("i", "<C-c>l", function()
	neocodeium.accept_line()
end)

-- Arrow
-- vim.keymap.set("n", "H", require("arrow.persist").previous)
-- vim.keymap.set("n", "L", require("arrow.persist").next)
-- vim.keymap.set("n", "<leader>ac", require("arrow.persist").toggle)

-- Obsidian.nvim
vim.keymap.set("n", "<leader>zf", "<cmd>ObsidianQuickSwitch<cr>")
vim.keymap.set("n", "<leader>zw", "<cmd>ObsidianSearch<cr>")
vim.keymap.set("n", "<leader>zd", "<cmd>ObsidianFollowLink<cr>")
vim.keymap.set("n", "<leader>z|", ":vsplit<cr> :ObsidianFollowLink<cr>")
vim.keymap.set("n", "<leader>zc", obsidian.createNoteWithDefaultTemplate)
vim.keymap.set("n", "<leader>zC", obsidian.createAnkiNoteWithDefaultTemplate)
vim.keymap.set("n", "<leader>zb", "<cmd>ObsidianBacklinks<cr>")
vim.keymap.set("x", "<leader>zl", "<cmd>ObsidianLink<cr>")
vim.keymap.set("n", "<leader>zt", "<cmd>ObsidianTags<cr>")

-- Logsitter
vim.keymap.set("n", "<leader>ll", require("logsitter").log)
vim.keymap.set("n", "<leader>lc", require("logsitter").clear_buf)

return {
	neotree = setup_neotree_mappings,
	-- telescope = setup_telescope_mappings,
}
