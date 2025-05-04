return {
  'echasnovski/mini.nvim',
  opts = {
    cursorword = {
      delay = 400,
    },
  },
  config = function(_, opts)
    require('mini.ai').setup(opts.ai)
    require('mini.diff').setup(opts.diff)
    require('mini.move').setup(opts.move)
    require('mini.comment').setup(opts.comment)
    require('mini.cursorword').setup(opts.cursorword)
  end,
}
