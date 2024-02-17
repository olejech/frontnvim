local mappings = require("core.mappings")

vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
  default_component_configs = {
    file_size = { enabled = false },
    type = { enabled = false },
    last_modified = { enabled = false },
    created = { enabled = false },
    git_status = {
      symbols = {
        deleted   = "✖",
        renamed   = "󰁕",
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    mappings = mappings.neotree(),
    position = "float",
  },
  filesystem = {
    follow_current_file = {
      enabled = true
    },
  },
  hide_root_node = true,
})
