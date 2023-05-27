local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function filter(arr, fn)
	if type(arr) ~= "table" then
		return arr
	end

	local filtered = {}
	for k, v in pairs(arr) do
		if fn(v, k, arr) then
			table.insert(filtered, v)
		end
	end

	return filtered
end

local function filterReactDTS(value)
	-- Depending on typescript version either uri or targetUri is returned
	if value.uri then
		return string.match(value.uri, "%.d.ts") == nil
	elseif value.targetUri then
		return string.match(value.targetUri, "%.d.ts") == nil
	end
end

return {
	handlers = {
		["textDocument/definition"] = function(err, result, method, ...)
			if vim.tbl_islist(result) and #result > 1 then
				local filtered_result = filter(result, filterReactDTS)
				return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
			end

			vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
		end,
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", silent = true }),
		["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{ border = "rounded", silent = true }
		),
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
	end,
	capabilities = capabilities,
}
