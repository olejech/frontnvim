require("conform").setup({
	formatters_by_ft = {
		html = { "prettierd" },
		css = { "prettierd", "stylelint" },
		scss = { "prettierd", "stylelint" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		markdown = { "prettierd" },
		mdx = { "prettierd" },
		yaml = { "prettierd" },
		astro = { "prettierd" },
		lua = { "stylua" },
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
	formatters = {
		prettierd = {},
	},
})
