local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{ "nvim-treesitter/nvim-treesitter", dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" } },
	{ "neovim/nvim-lspconfig", event = "InsertEnter" },
	{ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
	{ "hrsh7th/cmp-buffer", event = "BufEnter" },
	{ "hrsh7th/cmp-path", event = "InsertEnter" },
	{ "hrsh7th/cmp-cmdline", event = "BufEnter" },
	{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
	{ "hrsh7th/vim-vsnip", event = "BufEnter" },
	{ "hrsh7th/cmp-vsnip", event = "BufEnter" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
		event = "BufEnter",
	},
	{ "jose-elias-alvarez/null-ls.nvim", event = "BufEnter" },
	{ "windwp/nvim-autopairs", event = "InsertEnter" },
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	{ "numToStr/Comment.nvim", event = "InsertEnter" },
	{ "lewis6991/gitsigns.nvim" },
	{ "mrjones2014/smart-splits.nvim" },
	{ "mattkubej/jest.nvim", cmd = { "Jest", "JestFile", "JestSingle" } },
	{ "EdenEast/nightfox.nvim" },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "RutaTang/quicknote.nvim", event = "VeryLazy" },
	{ "Exafunction/codeium.vim", event = "InsertEnter" },
	{ "ThePrimeagen/harpoon", event = "VeryLazy" },
	{ "folke/todo-comments.nvim" },
	{ "Bryley/neoai.nvim" },
	{ "dmmulroy/tsc.nvim", event = "BufEnter" },
}, {
	defaults = {
		lazy = true,
	},
})
