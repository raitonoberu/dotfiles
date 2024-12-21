return {
  'ibhagwan/fzf-lua',
  cmd = 'FzfLua',
  opts = {
    'fzf-native',
    defaults = {
      header = false,
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>sf', '<cmd>FzfLua files<cr>', desc = '[S]earch [F]iles' },
    { '<leader><leader>', '<cmd>FzfLua live_grep_native<cr>', desc = '[ ] Live Grep' },
    { '<leader>/', '<cmd>FzfLua lgrep_curbuf<cr>', desc = '[/] Search Buffer' },
    { '<leader>sw', '<cmd>FzfLua grep_cword<cr>', desc = '[S]earch [W]ord' },
    { '<leader>sv', '<cmd>FzfLua grep_visual<cr>', desc = '[S]earch [V]isual' },
    { '<leader>sr', '<cmd>FzfLua resume<cr>', desc = '[S]earch [R]esume' },
  },
}
