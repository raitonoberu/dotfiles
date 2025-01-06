local function alt(key)
  return {
    '<A-' .. key .. '>',
    function()
      local grapple = require 'grapple'

      local target = grapple.find { index = key }
      if target == nil or target.path == vim.api.nvim_buf_get_name(0) then
        return
      end

      grapple.select { index = key }
    end,
    mode = { 'n', 'i' },
  }
end

return {
  'cbochs/grapple.nvim',
  cmd = 'Grapple',
  keys = {
    {
      '<leader><Tab>',
      function()
        require('grapple').toggle()
      end,
      desc = 'Grapple toggle tag',
    },
    {
      '<Tab>',
      function()
        require('grapple').toggle_tags()
      end,
      desc = 'Grapple open tags window',
    },
    {
      ']g',
      function()
        require('grapple').cycle_tags 'next'
      end,
      desc = 'Go to next [G]rapple tag',
    },
    {
      '[g',
      function()
        require('grapple').cycle_tags 'prev'
      end,
      desc = 'Go to previous [G]rapple tag',
    },
    alt(1),
    alt(2),
    alt(3),
    alt(4),
    alt(5),
  },
}
