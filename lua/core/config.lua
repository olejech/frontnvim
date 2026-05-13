vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.winbar = "%f%m"
vim.opt.pumheight = 10
vim.opt.cursorline = true
vim.cmd.language("en_US")
vim.opt.spelllang = "ru,en_us"
vim.opt.fillchars = { eob = " " }
vim.opt.wrap = true
vim.opt.conceallevel = 2
vim.opt.winborder = "rounded"
vim.diagnostic.config({
	signs = false,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
})
