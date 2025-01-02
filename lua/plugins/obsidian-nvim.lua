local home = vim.fn.expand(os.getenv("ZETTELKASTEN_PATH"))

local function createNoteWithDefaultTemplate()
  local TEMPLATE_FILENAME = "NoteTemplate"
  local obsidian = require("obsidian").get_client()
  local utils = require("obsidian.util")

  local note
  local title = utils.input("Enter title or path (optional): ")
  if not title then
    return
  elseif title == "" then
    title = nil
  end

  note = obsidian:create_note({ title = title, no_write = true })

  if not note then
    return
  end
  obsidian:open_note(note, { sync = true })
  vim.cmd("ObsidianTemplate " .. TEMPLATE_FILENAME)
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
})

return {
  createNoteWithDefaultTemplate = createNoteWithDefaultTemplate
}
