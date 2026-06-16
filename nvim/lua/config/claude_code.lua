local M = {}
local state = { buf = nil, chan = nil }

local function is_valid()
  return state.buf and vim.api.nvim_buf_is_valid(state.buf) and state.chan
end

local function find_win()
  if not is_valid() then return nil end
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == state.buf then return win end
  end
end

function M.toggle()
  local win = find_win()
  if win then
    vim.api.nvim_win_close(win, false)
    return
  end
  if is_valid() then
    vim.cmd 'vsplit | wincmd L'
    vim.api.nvim_win_set_buf(0, state.buf)
  else
    vim.cmd 'vsplit | wincmd L | terminal claude'
    state.buf = vim.api.nvim_get_current_buf()
    state.chan = vim.b.terminal_job_id
  end
  vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.42))
  vim.cmd 'startinsert'
end

local function focus(delay)
  vim.defer_fn(function()
    local win = find_win()
    if win then
      vim.api.nvim_set_current_win(win)
      vim.cmd 'startinsert'
    end
  end, delay or 0)
end

-- Send @filepath reference into Claude Code input line
function M.send_file()
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' then
    vim.notify('No file in current buffer', vim.log.levels.WARN)
    return
  end
  local already_open = find_win() ~= nil
  if not already_open then M.toggle() end
  vim.defer_fn(function()
    if state.chan then vim.fn.chansend(state.chan, '@' .. path .. ' ') end
    focus()
  end, already_open and 0 or 400)
end

-- Copy selected code as fenced block to clipboard, then focus Claude Code
function M.send_selection()
  local s = vim.fn.getpos "'<"
  local e = vim.fn.getpos "'>"
  local lines = vim.api.nvim_buf_get_lines(0, s[2] - 1, e[2], false)
  if #lines == 0 then return end
  local text = '```' .. vim.bo.filetype .. '\n' .. table.concat(lines, '\n') .. '\n```'
  vim.fn.setreg('+', text)
  vim.notify('Copied — paste in Claude Code with Cmd+V', vim.log.levels.INFO)
  local already_open = find_win() ~= nil
  if not already_open then M.toggle() end
  focus(already_open and 0 or 400)
end

return M
