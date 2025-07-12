local M = {}

M.nav_to_first_character_of_next_line = {
  instruction_lines = {
    "Jump from the cursor position to the first non blank character of the next line."
  },
  exercise_lines = {
    "function test()",
    "  print('Hello')",
    "end"
  },
  start_position = {
    row = 0,
    column = 7
  },
  filetype = "lua",
  expected_keys = { "+" }
}

return M
