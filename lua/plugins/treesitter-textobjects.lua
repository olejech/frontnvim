require("nvim-treesitter-textobjects").setup({
  select = { lookahead = true },
  move = { set_jumps = true },
})

local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

-- Select
vim.keymap.set({ "x", "o" }, "a=", function() select.select_textobject("@assignment.outer", "textobjects") end, { desc = "Select outer part of an assignment" })
vim.keymap.set({ "x", "o" }, "i=", function() select.select_textobject("@assignment.inner", "textobjects") end, { desc = "Select inner part of an assignment" })
vim.keymap.set({ "x", "o" }, "r=", function() select.select_textobject("@assignment.rhs", "textobjects") end, { desc = "Select right hand side of an assignment" })
vim.keymap.set({ "x", "o" }, "aa", function() select.select_textobject("@parameter.outer", "textobjects") end, { desc = "Select outer part of a parameter/argument" })
vim.keymap.set({ "x", "o" }, "ia", function() select.select_textobject("@parameter.inner", "textobjects") end, { desc = "Select inner part of a parameter/argument" })
vim.keymap.set({ "x", "o" }, "ai", function() select.select_textobject("@conditional.outer", "textobjects") end, { desc = "Select outer part of a conditional" })
vim.keymap.set({ "x", "o" }, "ii", function() select.select_textobject("@conditional.inner", "textobjects") end, { desc = "Select inner part of a conditional" })
vim.keymap.set({ "x", "o" }, "al", function() select.select_textobject("@loop.outer", "textobjects") end, { desc = "Select outer part of a loop" })
vim.keymap.set({ "x", "o" }, "il", function() select.select_textobject("@loop.inner", "textobjects") end, { desc = "Select inner part of a loop" })
vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@call.outer", "textobjects") end, { desc = "Select outer part of a function call" })
vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@call.inner", "textobjects") end, { desc = "Select inner part of a function call" })
vim.keymap.set({ "x", "o" }, "am", function() select.select_textobject("@function.outer", "textobjects") end, { desc = "Select outer part of a method/function def" })
vim.keymap.set({ "x", "o" }, "im", function() select.select_textobject("@function.inner", "textobjects") end, { desc = "Select inner part of a method/function def" })
vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer", "textobjects") end, { desc = "Select outer part of a class" })
vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner", "textobjects") end, { desc = "Select inner part of a class" })

-- Move
vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@call.outer", "textobjects") end, { desc = "Next function call start" })
vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next method/function def start" })
vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
vim.keymap.set({ "n", "x", "o" }, "]i", function() move.goto_next_start("@conditional.outer", "textobjects") end, { desc = "Next conditional start" })
vim.keymap.set({ "n", "x", "o" }, "]l", function() move.goto_next_start("@loop.outer", "textobjects") end, { desc = "Next loop start" })
vim.keymap.set({ "n", "x", "o" }, "]F", function() move.goto_next_end("@call.outer", "textobjects") end, { desc = "Next function call end" })
vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "Next method/function def end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function() move.goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
vim.keymap.set({ "n", "x", "o" }, "]I", function() move.goto_next_end("@conditional.outer", "textobjects") end, { desc = "Next conditional end" })
vim.keymap.set({ "n", "x", "o" }, "]L", function() move.goto_next_end("@loop.outer", "textobjects") end, { desc = "Next loop end" })
vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@call.outer", "textobjects") end, { desc = "Prev function call start" })
vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev method/function def start" })
vim.keymap.set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
vim.keymap.set({ "n", "x", "o" }, "[i", function() move.goto_previous_start("@conditional.outer", "textobjects") end, { desc = "Prev conditional start" })
vim.keymap.set({ "n", "x", "o" }, "[l", function() move.goto_previous_start("@loop.outer", "textobjects") end, { desc = "Prev loop start" })
vim.keymap.set({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@call.outer", "textobjects") end, { desc = "Prev function call end" })
vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev method/function def end" })
vim.keymap.set({ "n", "x", "o" }, "[C", function() move.goto_previous_end("@class.outer", "textobjects") end, { desc = "Prev class end" })
vim.keymap.set({ "n", "x", "o" }, "[I", function() move.goto_previous_end("@conditional.outer", "textobjects") end, { desc = "Prev conditional end" })
vim.keymap.set({ "n", "x", "o" }, "[L", function() move.goto_previous_end("@loop.outer", "textobjects") end, { desc = "Prev loop end" })

-- Repeatable move
local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
