local augroup = vim.api.nvim_create_augroup
local namespace = vim.api.nvim_create_namespace
local cmd = vim.api.nvim_create_autocmd

-- auto enable/disable search highlight
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, namespace("auto_hlsearch"))

-- Hightlight yanked text
cmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- set clear color for lsp hover
local set_hl_for_floating_window = function()
  vim.api.nvim_set_hl(0, "NormalFloat", {
    link = "Normal",
  })
  vim.api.nvim_set_hl(0, "FloatBorder", {
    bg = "none",
  })
end
set_hl_for_floating_window()

cmd("ColorScheme", {
  pattern = "*",
  desc = "Avoid overwritten by loading color schemes later",
  callback = set_hl_for_floating_window,
})

-- disable set comment on new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")

-- show recording macros status
vim.cmd("autocmd RecordingEnter * set cmdheight=1")
vim.cmd("autocmd RecordingLeave * set cmdheight=0")

-- disable fixendofline https://github.com/neovim/neovim/issues/21648
-- require("editorconfig").properties.insert_final_newline = nil
