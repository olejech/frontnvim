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
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  { "neovim/nvim-lspconfig", event = "InsertEnter" },
  { "hrsh7th/cmp-nvim-lsp",  event = "InsertEnter" },
  { "hrsh7th/cmp-buffer",    event = "InsertEnter" },
  { "hrsh7th/cmp-path",      event = "InsertEnter" },
  { "hrsh7th/cmp-cmdline",   event = "BufEnter" },
  { "hrsh7th/nvim-cmp",      event = "InsertEnter" },
  { "hrsh7th/vim-vsnip",     event = "InsertEnter" },
  { "hrsh7th/cmp-vsnip",     event = "InsertEnter" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
    event = "BufEnter",
  },
  { "jose-elias-alvarez/null-ls.nvim", event = "BufEnter" },
  { "windwp/nvim-autopairs",           event = "InsertEnter" },
  { "windwp/nvim-ts-autotag",          event = "InsertEnter" },
  { "numToStr/Comment.nvim",           event = "InsertEnter" },
  { "lewis6991/gitsigns.nvim" },
  { "mrjones2014/smart-splits.nvim" },
  { "mattkubej/jest.nvim",             cmd = { "Jest", "JestFile", "JestSingle" } },
  { "stevearc/dressing.nvim",          lazy = true,                               event = "InsertEnter" },
  { "RutaTang/quicknote.nvim",         event = "VeryLazy" },
  { "Exafunction/codeium.vim",         event = "BufEnter" },
  { "ThePrimeagen/harpoon",            event = "VeryLazy" },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    lazy = true,
    event = "VimEnter",
    -- https://github.com/folke/todo-comments.nvim/issues/133
    config = function()
      require("todo-comments").setup({
        signs = false,
      })
    end,
  },
  { "dmmulroy/tsc.nvim",          event = "BufEnter" },
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
  },
  { "folke/neodev.nvim",          event = "InsertEnter" },
  { "echasnovski/mini.surround",  version = "*",        event = "VeryLazy" },
  { "rebelot/kanagawa.nvim",      priority = 1000,      lazy = false },
  { "elentok/format-on-save.nvim" },
  { "AstroNvim/astrotheme" }
}, {
  defaults = {
    lazy = true,
  },
})
