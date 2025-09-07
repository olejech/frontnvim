return {
	picker = {
		enabled = true,
		layouts = {
			default = {
				fullscreen = true,
				layout = {
					reverse = false,
					box = "horizontal",
					backdrop = false,
					width = 0.5,
					height = 0.5,
					border = "none",
					{
						box = "vertical",
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
						{ win = "list", title = " Results ", title_pos = "center", border = "rounded" },
					},
					{
						win = "preview",
						title = "{preview:Preview}",
						width = 0.7,
						border = "rounded",
						title_pos = "center",
					},
				},
			},
		},
	},
}
