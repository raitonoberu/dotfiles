return {
  'echasnovski/mini.nvim',
  opts = {
    ai = { n_lines = 500 },
    cursorword = { delay = 400 },
    diff = {
      view = {
        style = 'sign',
        signs = { add = '|', change = '|', delete = '|' },
        priority = 1,
      },
    },
  },
  config = function(_, opts)
    require('mini.ai').setup(opts.ai)
    require('mini.surround').setup(opts.surround)
    require('mini.move').setup(opts.move)
    require('mini.comment').setup(opts.comment)
    require('mini.cursorword').setup(opts.cursorword)
    require('mini.diff').setup(opts.diff)
  end,
}
