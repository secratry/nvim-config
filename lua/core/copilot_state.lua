local M = {}

local state_file = vim.fn.stdpath('state') .. '/copilot_state'

function M.load()
  local file = io.open(state_file, 'r')
  if file then
    local content = file:read('*a')
    file:close()
    return content == 'true'
  end
  return true -- default enabled
end

function M.save(enabled)
  local file = io.open(state_file, 'w')
  if file then
    file:write(tostring(enabled))
    file:close()
  else
    -- Ensure directory exists
    local dir = vim.fn.fnamemodify(state_file, ':h')
    vim.fn.mkdir(dir, 'p')
    file = io.open(state_file, 'w')
    if file then
      file:write(tostring(enabled))
      file:close()
    end
  end
end

return M