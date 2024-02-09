local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local prettierd = formatters.shell({ cmd = { "prettierd", "%", "--cache" } })

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    html = formatters.lsp,
    css = formatters.lsp,
    scss = prettierd,
    javascript = { prettierd, formatters.eslint_d_fix },
    typescript = { prettierd, formatters.eslint_d_fix },
    typescriptreact = { prettierd, formatters.eslint_d_fix },
    lua = formatters.lsp,
    markdown = prettierd,
    yaml = formatters.lsp,
    telekasten = formatters.prettierd
  },
  experiments = {
    partial_update = "diff", -- or 'line-by-line'
  },
})
