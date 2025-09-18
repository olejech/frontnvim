local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local snacksOpts = require("plugins.snacks")

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
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		branch = "master",
	},
	{
		"neovim/nvim-lspconfig",
		event = "InsertEnter",
		dependencies = { "saghen/blink.cmp" },
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		event = "VeryLazy",
	},
	{ "windwp/nvim-ts-autotag", event = "InsertEnter" },
	{ "numToStr/Comment.nvim", event = "InsertEnter" },
	{ "lewis6991/gitsigns.nvim" },
	{ "mrjones2014/smart-splits.nvim" },
	{ "mattkubej/jest.nvim", cmd = { "Jest", "JestFile", "JestSingle" } },
	{ "RutaTang/quicknote.nvim", event = "VeryLazy" },
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		event = "VimEnter",
		-- https://github.com/folke/todo-comments.nvim/issues/133
		config = function()
			require("todo-comments").setup({
				signs = false,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "InsertEnter",
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{ "gaelph/logsitter.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "ivanesmantovich/xkbswitch.nvim" },
	{
		"saghen/blink.cmp",
		version = "*",
		opts_extend = { "sources.default" },
	},
	{
		"stevearc/conform.nvim",
	},
	{ "echasnovski/mini.nvim", version = false },
	{
		"obsidian-nvim/obsidian.nvim",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"saghen/blink.cmp",
		},
	},
	{
		"davidmh/mdx.nvim",
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		lazy = false,
	},
	{
		"Wansmer/langmapper.nvim",
		lazy = false,
		priority = 1, -- High priority is needed if you will use `autoremap()`
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = snacksOpts,
	},
}, {
	defaults = {
		lazy = true,
	},
})
