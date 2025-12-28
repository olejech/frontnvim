local lua_ls_config = require("plugins.lsp.lua-ls")

vim.lsp.config("lua_ls", lua_ls_config)
vim.lsp.config("astro", {})
vim.lsp.config("tailwindcss", {})
vim.lsp.config("eslint", {
	on_attach = function(client, bufnr)
		-- Auto-fix on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				local params = {
					command = "eslint.applyAllFixes",
					arguments = {
						{
							uri = vim.uri_from_bufnr(bufnr),
							version = vim.lsp.util.buf_versions[bufnr],
						},
					},
				}
				-- Use request_sync to ensure fixes are applied before save
				client.request_sync("workspace/executeCommand", params, 1000, bufnr)
			end,
		})
	end,
	settings = {
		format = false,
	},
})
vim.lsp.config("gopls", {})
vim.lsp.config("stylelint_lsp", {})

vim.lsp.enable({ "lua_ls", "astro", "tailwindcss", "eslint", "gopls", "stylelint_lsp" })
