local enabledFiletypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "astro", "lua" }

local filter = function(bufnr)
	local isAcceptFileTypes =
		vim.tbl_contains(enabledFiletypes, vim.api.nvim_get_option_value("filetype", { buf = bufnr }))

	return isAcceptFileTypes
end

require("neocodeium").setup({
	filter = filter,
	completion = {
		menu = {
			auto_show = function(ctx)
				return ctx.mode ~= "default"
			end,
		},
	},
	silent = true,
})
