local home = vim.fn.expand(os.getenv("ZETTELKASTEN_PATH"))

local function createNoteWithDefaultTemplate()
  local TEMPLATE_FILENAME = "NoteTelekastenTemplate"
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
  obsidian:write_note_to_buffer(note, { template = TEMPLATE_FILENAME })
  vim.cmd("normal! 7k")
end

require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = home
    },
  },
  notes_subdir = "Base",
  daily_notes = {
    folder = "Daily",
  },
  templates = {
    folder = "Templates",
  },
  picker = {
    name = "fzf-lua",
  },
  attachments = {
    img_folder = "Files"
  },
  note_id_func = function(title)
    return title
  end,
  disable_frontmatter = true,
  mappings = {},
  open_app_foreground = true
})

return {
  createNoteWithDefaultTemplate = createNoteWithDefaultTemplate
}
