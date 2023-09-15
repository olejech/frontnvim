require("kanagawa").setup({
  overrides = function()
    return {
      Boolean = { link = "Special" },
      ["@lsp.typemod.function.readonly"] = { bold = false },
    }
  end,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
})
vim.cmd("colorscheme kanagawa")
