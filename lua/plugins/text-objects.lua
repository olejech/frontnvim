require("mini.ai").setup({
	custom_textobjects = {
		t = false,

		-- camelCase, snake_case and uppercase snake_case
		s = {
			{
				"%u[%l%d]+%f[^%l%d]",
				"%f[%S][%l%d]+%f[^%l%d]",
				"%f[%P][%l%d]+%f[^%l%d]",
				"^[%l%d]+%f[^%l%d]",
				"%f[%S][%w]+%f[^%w]",
				"%f[%P][%w]+%f[^%w]",
				"^%w+%f[^%w]",
			},
			"^().*()$",
		},
	},
})
