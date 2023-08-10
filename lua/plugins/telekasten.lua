local home = vim.fn.expand(os.getenv("ZETTELKASTEN_PATH"))
require("telekasten").setup({
	home = home .. "Base",
	dailies = home .. "Daily",
	templates = home .. "Templates",
	template_new_note = home .. "Templates/NoteTelekastenTemplate.md",
})
