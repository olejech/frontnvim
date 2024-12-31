local lspconfig = require("lspconfig")
local lua_ls = require("plugins.lsp.lua-ls")

lspconfig.lua_ls.setup(lua_ls)
lspconfig.astro.setup({})
lspconfig.tailwindcss.setup({})
-- lspconfig.stylelint_lsp.setup({
--   settings = {
--     stylelintplus = {
--       autoFixOnSave = true,
--     },
--   },
--   filetypes = { "css", "scss" }
-- })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gD", ":vsplit<cr> :lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<space>ld", vim.diagnostic.open_float, opts)
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
  end,
})

vim.diagnostic.config({
  float = { border = "rounded" },
})
