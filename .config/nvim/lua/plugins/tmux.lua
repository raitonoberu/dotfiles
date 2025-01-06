return {
  'alexghergh/nvim-tmux-navigation',
  opts = {},
  cmd = {
    'NvimTmuxNavigateUp',
    'NvimTmuxNavigateDown',
    'NvimTmuxNavigateLeft',
    'NvimTmuxNavigateRight',
    'NvimTmuxNavigateLastActive',
  },
  keys = {
    { '<C-h>', '<cmd>NvimTmuxNavigateLeft<cr>', desc = 'Navigate left' },
    { '<C-j>', '<cmd>NvimTmuxNavigateDown<cr>', desc = 'Navigate down' },
    { '<C-k>', '<cmd>NvimTmuxNavigateUp<cr>', desc = 'Navigate up' },
    { '<C-l>', '<cmd>NvimTmuxNavigateRight<cr>', desc = 'Navigate right' },
    { '<C-\\>', '<cmd>NvimTmuxNavigateLastActive<cr>', desc = 'Navigate last active' },
  },
}
