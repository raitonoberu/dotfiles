return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    { '<leader>d', group = '[D]ebug' },
    { '<leader>t', group = '[T]est' },
    { '<leader>s', group = '[S]earch' },
  },
  config = function(_, keys)
    require('which-key').add(keys)
  end,
}
