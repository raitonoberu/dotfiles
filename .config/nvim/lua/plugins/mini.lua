return {
  'echasnovski/mini.nvim',
  opts = {
    ai = { n_lines = 500 },
  },
  config = function(_, opts)
    require('mini.ai').setup(opts.ai)
    require('mini.surround').setup(opts.surround)
    require('mini.move').setup(opts.move)
    require('mini.comment').setup(opts.comment)
    require('mini.diff').setup(opts.diff)
  end,
}
