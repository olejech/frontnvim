-- TODO: used in generic ui project
local function select_prettier(bufnr, extra_formatters)
	local has_prettier_json = vim.fs.find("prettier.json", {
		upward = true,
		path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":h"),
	})[1]

	local formatter = has_prettier_json and "prettier" or "prettierd"

	if extra_formatters then
		return vim.list_extend({ formatter }, extra_formatters)
	end

	return { formatter }
end

require("conform").setup({
	formatters_by_ft = {
		html = function(bufnr)
			return select_prettier(bufnr)
		end,
		css = function(bufnr)
			return select_prettier(bufnr, { "stylelint" })
		end,
		scss = function(bufnr)
			return select_prettier(bufnr, { "stylelint" })
		end,
		javascript = function(bufnr)
			return select_prettier(bufnr)
		end,
		javascriptreact = function(bufnr)
			return select_prettier(bufnr)
		end,
		typescript = function(bufnr)
			return select_prettier(bufnr)
		end,
		typescriptreact = function(bufnr)
			return select_prettier(bufnr)
		end,
		markdown = function(bufnr)
			return select_prettier(bufnr)
		end,
		mdx = function(bufnr)
			return select_prettier(bufnr)
		end,
		yaml = function(bufnr)
			return select_prettier(bufnr)
		end,
		astro = function(bufnr)
			return select_prettier(bufnr)
		end,
		lua = { "stylua" },
	},
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
	formatters = {
		prettier = {
			prepend_args = function(_, ctx)
				local found = vim.fs.find("prettier.json", { upward = true, path = ctx.dirname })[1]
				if found then
					return { "--config", found }
				end
				return {}
			end,
		},
	},
})
