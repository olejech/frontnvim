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
    branch = "v3.x",
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
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
  },
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    }
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
  { "dmmulroy/tsc.nvim",          event = "BufEnter" },
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
  },
  { "folke/neodev.nvim",          event = "InsertEnter" },
  { "elentok/format-on-save.nvim" },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
  },
  {
    "kazhala/close-buffers.nvim", event = "BufEnter"
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "InsertEnter"
  },
  {
    "phelipetls/jsonpath.nvim",
    event = "BufEnter"
  },
  { "onsails/lspkind.nvim",  event = "InsertEnter" },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  { "gaelph/logsitter.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { 'ivanesmantovich/xkbswitch.nvim' },
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}, {
  defaults = {
    lazy = true,
  },
})
