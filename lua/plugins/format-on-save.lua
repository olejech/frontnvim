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
		javascript = formatters.lsp,
		typescript = formatters.prettierd,
		typescriptreact = formatters.prettierd,
		json = formatters.prettierd,
		lua = formatters.lsp,
		markdown = formatters.prettierd,
		yaml = formatters.lsp,
	},
})
