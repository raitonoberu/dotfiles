return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  opts = {},
  event = { 'VimEnter', 'BufNew' },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<A-d>',
      function()
        require('oil').open()
      end,
      desc = 'Open parent directory',
    },
  },
}
