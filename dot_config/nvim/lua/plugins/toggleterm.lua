local _float_term = nil
local function float_term()
  if not _float_term then
    _float_term = require('toggleterm.terminal').Terminal:new {
      cmd = 'fish',
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    }
  end
  return _float_term
end

local function ensure_insert()
  local has_open, _ = require('toggleterm.ui').find_open_windows()
  if has_open then
    vim.cmd 'startinsert'
  end
end

return {
  'akinsho/toggleterm.nvim',
  opts = {},
  keys = {
    {
      '<C-Space>',
      function()
        require('toggleterm').toggle()
        ensure_insert()
      end,
      mode = { 'n', 't' },
      desc = 'Toggle terminal',
    },
    {
      '<A-t>',
      function()
        float_term():toggle()
        ensure_insert()
      end,
      mode = { 'n', 't' },
      desc = 'Toggle floating terminal',
    },
  },
}
