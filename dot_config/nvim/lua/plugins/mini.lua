return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.move').setup()
    require('mini.comment').setup()
    require('mini.cursorword').setup { delay = 400 }
    require('mini.diff').setup()
  end,
}
