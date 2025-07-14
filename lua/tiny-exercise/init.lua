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
  local exercise = exercises.next_exercise()
  open_exercise(exercise)
  install_key_handler(exercise)
end

local current_expected_command_index = 1
local exercise_done = false

function install_key_handler(exercise)
  current_expected_command_index = 1
  exercise_done = false
  local keymap = vim.api.nvim_get_keymap("n")
  for i = 1, #keymap do
    local key = keymap[i]
    vim.keymap.set("n", key.lhs, function() key_handler(key, exercise.expected_keys) end,
      { noremap = false, desc = key.desc, buffer = 0 })
  end
end

function key_handler(args, expected_commands)
  if exercise_done then
    return
  end

  if args.lhs == expected_commands[current_expected_command_index] then
    local key_to_feed = vim.api.nvim_replace_termcodes(args.lhs, true, false, true)
    vim.api.nvim_feedkeys(key_to_feed, args.mode, false)
    current_expected_command_index = current_expected_command_index + 1
    if current_expected_command_index < #expected_commands then
      print("Good! You used the expected command. Go ahead with the next one!")
    else
      print("Congratulations, you mastered this exercise!")
      exercise_done = true
    end
  else
    print("'" ..
      args.lhs .. "' was not the expected command (" ..
      expected_commands[current_expected_command_index] .. "). Try again...")
  end
end

function open_exercise(exercise)
  local buf_id = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf_id, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf_id, 'swapfile', false)
  vim.cmd("buffer" .. buf_id)
  vim.cmd("file Training")
  if exercise.filetype then
    vim.cmd("set filetype=" .. exercise.filetype)
  end
  local instructions = prepare_instructions(exercise.instruction_lines)
  local mod_content = table_concat(instructions, exercise.exercise_lines)
  vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, mod_content)
  vim.api.nvim_win_set_cursor(0, { exercise.start_position.row + #instructions + 1, exercise.start_position.column })
end

-- Adds comment sign for each line and adds a blank line at the end
function prepare_instructions(instructions)
  local prepared = {}
  for i = 1, #instructions do
    prepared[#prepared + 1] = "-- " .. instructions[i]
  end
  prepared[#prepared + 1] = ""
  return prepared
end

-- concatenate the tables
function table_concat(t1, t2)
  local result = {}
  for i = 1, #t1 do
    result[#result + 1] = t1[i]
  end
  for i = 1, #t2 do
    result[#result + 1] = t2[i]
  end
  return result
end

return M
