local lspconfig = require("lspconfig")
local lua_ls = require("plugins.lsp.lua-ls")

lspconfig.lua_ls.setup(lua_ls)
lspconfig.astro.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.eslint.setup({})
lspconfig.gopls.setup({})

-- patch lsp floating window with borders
local orig = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border
		or {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		}
	return orig(contents, syntax, opts, ...)
end
