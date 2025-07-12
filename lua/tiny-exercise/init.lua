local exercises = require("tiny-exercise.exercises")
local M = {}

function M.setup(opts)
  opts = opts or {}

  vim.api.nvim_create_user_command(
    "Training",
    M.training,
    {}
  )
end

M.training = function()
  local buf_id = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf_id, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf_id, 'swapfile', false)
  vim.cmd("buffer" .. buf_id)
  vim.cmd("file Training")
  vim.cmd("2")
  local exercise = exercises.nav_to_first_character_of_next_line
  local instructions = prepareInstructions(exercise.instruction_lines)
  local mod_content = tableConcat(instructions, exercise.exercise_lines)
  vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, mod_content)
end

-- Adds comment sign for each line and adds a blank line at the end
function prepareInstructions(instructions)
  local prepared = {}
  for i = 1, #instructions do
    prepared[#prepared + 1] = "-- " .. instructions[i]
  end
  prepared[#prepared + 1] = ""
  return prepared
end

-- concatenate the tables
function tableConcat(t1, t2)
  for i = 1, #t2 do
    t1[#t1 + 1] = t2[i]
  end
  return t1
end

return M
