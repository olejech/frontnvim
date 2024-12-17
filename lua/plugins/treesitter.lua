require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "javascript",
    "typescript",
    "tsx",
    "vimdoc",
    "lua",
    "markdown",
    "json",
    "graphql",
    "vim",
    "html",
    "css",
    "scss",
    "markdown_inline",
    "diff"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  indent = { enable = true },
})
