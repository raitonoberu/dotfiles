return {
  'echasnovski/mini.nvim',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = true }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.indentscope').setup()
    require('mini.move').setup()
    require('mini.comment').setup()
    require('mini.cursorword').setup { delay = 400 }
  end,
}
