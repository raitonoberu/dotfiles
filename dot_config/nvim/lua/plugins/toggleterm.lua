local _float_term = nil
local function float_term()
  if not _float_term then
    _float_term = require('toggleterm.terminal').Terminal:new {
      hidden = true,
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    }
  end
  return _float_term
end

return {
  'akinsho/toggleterm.nvim',
  opts = {
    autochdir = true,
  },
  keys = {
    {
      '<A-t>',
      function()
        float_term():toggle()
      end,
      mode = { 'n', 't' },
      desc = '[T]oggle [t]erminal',
    },
  },
}
