local mappings = require("core.mappings")

require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
    },
    sorting_strategy = "ascending",
    mappings = mappings.telescope(),
  },
  pickers = {
    lsp_definitions = {
      file_ignore_patterns = { "index.d.ts" },
    },
    find_files = {
      hidden = true,
      file_ignore_patterns = { ".git/", "index.ts", "%.lock" },
    },
    lsp_references = {
      show_line = false,
    },
    live_grep = {
      file_ignore_patterns = { ".git/", "%.lock", "%.svg" },
    },
  },
})
