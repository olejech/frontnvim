local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    html = formatters.lsp,
    css = formatters.lsp,
    scss = formatters.prettierd,
    javascript = { formatters.prettierd, formatters.eslint_d_fix },
    typescript = { formatters.prettierd, formatters.eslint_d_fix },
    typescriptreact = { formatters.prettierd, formatters.eslint_d_fix },
    json = formatters.prettierd,
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    telekasten = formatters.prettierd,
    yaml = formatters.lsp,
  },
  experiments = {
    partial_update = "diff", -- or 'line-by-line'
  },
})
