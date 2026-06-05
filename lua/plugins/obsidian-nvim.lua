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

	local template = isAnkiNote and TEMPLATE_ANKI_FILENAME or TEMPLATE_FILENAME

	local note = Note.create({
		id = title,
		template = template,
		should_write = true,
	})

	if not note then
		return
	end

	note:open({ sync = true })
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
		folder = "Files",
	},
	picker = {
		name = "snacks.pick",
	},
	frontmatter = {
		enabled = false,
	},
	completion = {
		nvim_cmp = false,
		blink = true,
		min_chars = 2,
	},
	note_id_func = function(title)
		if title ~= nil and title ~= "" then
			return title
		end
		return tostring(os.time())
	end,
	legacy_commands = false,
})

return {
	createNoteWithDefaultTemplate = createNoteWithDefaultTemplate,
	createAnkiNoteWithDefaultTemplate = function()
		createNoteWithDefaultTemplate(true)
	end,
}
