local home = vim.fn.expand(os.getenv("ZETTELKASTEN_PATH"))

local function createNoteWithDefaultTemplate(isAnkiNote)
	local TEMPLATE_FILENAME = "NoteTemplate"
	local TEMPLATE_ANKI_FILENAME = "NoteAnkiTemplate"
	local utils = require("obsidian.util")
	local Note = require("obsidian.note")

	local FLASHCARDS_PATH = "Flashcards/"
	local title = utils.input("Enter title or path (optional): ")
	if not title then
		return
	elseif title == "" then
		title = nil
	elseif isAnkiNote then
		title = FLASHCARDS_PATH .. title
	end

	local note = Note.create({
		title = title,
		should_write = false,
	})

	if not note then
		return
	end

	note:open({ sync = true })

	if isAnkiNote then
		vim.cmd("Obsidian template " .. TEMPLATE_ANKI_FILENAME)
	else
		vim.cmd("Obsidian template " .. TEMPLATE_FILENAME)
	end
end

require("obsidian").setup({
	workspaces = {
		{
			name = "personal",
			path = home,
		},
	},
	notes_subdir = "Base",
	daily_notes = {
		folder = "Daily",
	},
	templates = {
		folder = "Templates",
	},
	attachments = {
		img_folder = "Files",
	},
	picker = {
		name = "snacks.pick",
	},
	disable_frontmatter = true,
	completion = {
		nvim_cmp = false,
		blink = true,
		min_chars = 2,
	},
	follow_url_func = function(url)
		vim.fn.jobstart({ "open", url })
	end,
	note_id_func = function(title)
		return title
	end,
	legacy_commands = false,
})

return {
	createNoteWithDefaultTemplate = createNoteWithDefaultTemplate,
	createAnkiNoteWithDefaultTemplate = function()
		createNoteWithDefaultTemplate(true)
	end,
}
