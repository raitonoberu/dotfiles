return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  opts = {
    watch_for_changes = true,
    keymaps = { ['<C-l>'] = false },
  },
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
