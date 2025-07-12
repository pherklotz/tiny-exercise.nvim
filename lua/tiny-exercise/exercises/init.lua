local M = {}

M.nav_to_first_character_of_next_line = {
  buffer = {
    "function test()",
    "  print('Hello')",
    "end"
  },
  start_position = {
    row = 0,
    column = 10
  }
}

return M
