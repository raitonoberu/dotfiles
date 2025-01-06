return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  event = { 'VimEnter', 'BufNew' },
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    watch_for_changes = true,
    keymaps = { ['<C-l>'] = false },
    view_options = { show_hidden = true },
  },
  keys = {
    { '<A-d>', '<cmd>Oil<cr>', desc = 'Open parent [D]irectory' },
  },
}
