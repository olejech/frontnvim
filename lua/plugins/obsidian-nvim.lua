local home = vim.fn.expand(os.getenv("ZETTELKASTEN_PATH"))

local function createNoteWithDefaultTemplate(isAnkiNote)
  local TEMPLATE_FILENAME = "NoteTemplate"
  local TEMPLATE_ANKI_FILENAME = "NoteAnkiTemplate"
  local obsidian = require("obsidian").get_client()
  local utils = require("obsidian.util")

  local note
  local FLASHCARDS_PATH = "Flashcards/"
  local title = utils.input("Enter title or path (optional): ")
  if not title then
    return
  elseif title == "" then
    title = nil
  elseif isAnkiNote then
    title = FLASHCARDS_PATH .. title
  end

  note = obsidian:create_note({ title = title, no_write = true })

  if not note then
    return
  end
  obsidian:open_note(note, { sync = true })
  if isAnkiNote then
    vim.cmd("ObsidianTemplate " .. TEMPLATE_ANKI_FILENAME)
  else
    vim.cmd("ObsidianTemplate " .. TEMPLATE_FILENAME)
  end
end

require("obsidian").setup({
  dir = home,
  notes_subdir = "Base",
  daily_notes = {
    folder = "Daily",
  },
  templates = {
    folder = "Templates",
  },
  attachments = {
    img_folder = "Files"
  },
  picker = {
    name = "fzf-lua",
  },
  disable_frontmatter = true,
  mappings = {},
  follow_url_func = function(url)
    vim.fn.jobstart({ "open", url })
  end,
  note_id_func = function(title)
    return title
  end,
})

return {
  createNoteWithDefaultTemplate = createNoteWithDefaultTemplate,
  createAnkiNoteWithDefaultTemplate = function() createNoteWithDefaultTemplate(true) end
}
