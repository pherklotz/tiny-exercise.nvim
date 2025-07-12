local exercises = require("vim-training.exercises")
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
  local mod_content = exercises.nav_to_first_character_of_next_line.buffer
  local content = {
    "This ia a test"
  }
  vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, mod_content)
end
return M
