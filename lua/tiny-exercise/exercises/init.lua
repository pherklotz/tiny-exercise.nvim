local M = {}

local exercises = {
  {
    instruction_lines = {
      "Increase the step_size value to 10."
    },
    exercise_lines = {
      "step_size  = 3",
    },
    start_position = {
      row = 0,
      column = 0
    },
    filetype = "lua",
    expected_keys = { "7", "<C-a>" }
  },
  {
    instruction_lines = {
      "Increase the step_size value to 3."
    },
    exercise_lines = {
      "step_size  = 10",
    },
    start_position = {
      row = 0,
      column = 0
    },
    filetype = "lua",
    expected_keys = { "7", "<C-x>" }
  },
  {
    instruction_lines = {
      "Append the second line to the first line."
    },
    exercise_lines = {
      "print(\"Hello \"",
      ".. world)"
    },
    start_position = {
      row = 0,
      column = 0
    },
    filetype = "lua",
    expected_keys = { "J" }
  },
  {
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
}

M.next_exercise = function()
  return exercises[math.random(#exercises)]
end

return M
