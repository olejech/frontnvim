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
  ui = {
    enable = false
  },
  note_id_func = function(title)
    return title
  end,
  note_frontmatter_func = function(note)
    if note.title then
      note:add_alias(note.title)
    end

    local datetime = os.date("%d-%m-%YT%H:%M")

    local out = { date = datetime, aliases = note.aliases, tags = note.tags, }

    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,
  disable_frontmatter = true,
  mappings = {},
})

return {
  createNoteWithDefaultTemplate = createNoteWithDefaultTemplate
}
