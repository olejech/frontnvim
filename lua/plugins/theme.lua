require("kanagawa").setup({
	colors = {
		palette = {
			peachRed = "#A3D4D5",
			surimiOrange = "#E6C384",
			samuraiRed = "#C34043",
			waveRed = "#938AA9",
		},
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})
vim.cmd.colorscheme("kanagawa")
