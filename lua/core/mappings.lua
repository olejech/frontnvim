local quicknote = require("quicknote")
local smart_splits = require("smart-splits")
local gitsigns = require("gitsigns")
local builtin = require("telescope.builtin")
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local todo = require("todo-comments")

vim.g.mapleader = " "

-- Custom
vim.keymap.set("n", "<leader>w", "<cmd>wa<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>")
vim.keymap.set("n", "|", "<cmd>vsplit<cr>")
vim.keymap.set("n", "\\", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>c", "<cmd>bd!<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>%bd!<cr>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>ll", "\"ayiwoconsole.log('<c-r>=expand('%:t:r')<cr> —> <C-R>a:', <C-R>a);<Esc>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fw", require("telescope").extensions.live_grep_args.live_grep_args, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fc", builtin.grep_string)
vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", function()
	builtin.git_bcommits({
		use_file_path = true,
		git_command = {
			"git",
			"log",
			-- "--date=format:%y/%m/%d",
			-- "--pretty=C(auto)%d (%cr) %cn %s",
			"--pretty=%h %s <%cn> (%cr)",
			"--follow",
		},
	})
end)
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
vim.keymap.set("n", "<leader>fr", builtin.resume)
vim.keymap.set("n", "<leader>fn", "<cmd>:cnext<cr>")
vim.keymap.set("n", "<leader>fp", "<cmd>:cprevious<cr>")

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree float toggle reveal<CR>")

-- Gitsigns
vim.keymap.set("n", "]g", gitsigns.next_hunk)
vim.keymap.set("n", "[g", gitsigns.prev_hunk)
vim.keymap.set("n", "<leader>gl", function()
	gitsigns.blame_line({ full = true })
end)
vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>gh", gitsigns.reset_hunk)
vim.keymap.set("n", "<leader>gr", gitsigns.reset_buffer)
vim.keymap.set("n", "<leader>gd", gitsigns.diffthis)

-- LSP
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename)
vim.keymap.set("i", "<C-e>", vim.lsp.buf.signature_help)

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
vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)
vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)

-- Quicknote
vim.keymap.set("n", "<leader>nC", quicknote.NewNoteAtCWD)
vim.keymap.set("n", "<leader>nc", quicknote.NewNoteAtCurrentLine)
vim.keymap.set("n", "<leader>no", quicknote.OpenNoteAtCurrentLine)
vim.keymap.set("n", "<leader>nO", quicknote.OpenNoteAtCWD)
vim.keymap.set("n", "<leader>nd", quicknote.DeleteNoteAtCurrentLine)
vim.keymap.set("n", "<leader>nn", quicknote.ListNotesForCWD)
vim.keymap.set("n", "<leader>n]", quicknote.JumpToNextNote)
vim.keymap.set("n", "<leader>n[", quicknote.JumpToPreviousNote)
vim.keymap.set("n", "<leader>nt", quicknote.ToggleNoteSigns)

-- Codeium
vim.keymap.set("i", "<C-c><cr>", vim.fn["codeium#Accept"], { expr = true })

-- Harpoon
vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file)
vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "L", harpoon_ui.nav_next)
vim.keymap.set("n", "H", harpoon_ui.nav_prev)
vim.keymap.set("n", "<leader>hc", harpoon_mark.clear_all)
vim.keymap.set("n", "<leader>h1", function()
	harpoon_ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>h2", function()
	harpoon_ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>h3", function()
	harpoon_ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>h4", function()
	harpoon_ui.nav_file(4)
end)
vim.keymap.set("n", "<leader>h5", function()
	harpoon_ui.nav_file(5)
end)

-- Todo
vim.keymap.set("n", "]t", todo.jump_next)
vim.keymap.set("n", "[t", todo.jump_prev)

-- NeoAI
vim.keymap.set("n", "<leader>aa", ":NeoAI<cr>")
vim.keymap.set("v", "<leader>ac", ":NeoAIContext<cr>")
vim.keymap.set("v", "<leader>ai", ":NeoAIInjectContext")
