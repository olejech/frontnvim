local lua_ls_config = require("plugins.lsp.lua-ls")

vim.lsp.config("lua_ls", lua_ls_config)
vim.lsp.config("astro", {})
vim.lsp.config("tailwindcss", {})
vim.lsp.config("eslint", {})
vim.lsp.config("gopls", {})

vim.lsp.enable({ "lua_ls", "astro", "tailwindcss", "eslint", "gopls" })
