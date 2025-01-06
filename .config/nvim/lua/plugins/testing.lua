return {
  'nvim-neotest/neotest',
  cmd = 'Neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',

    'fredrikaverpil/neotest-golang',
    'Issafalcon/neotest-dotnet',
  },
  keys = {
    { '<leader>tr', '<cmd>Neotest run<cr>', desc = '[T]est [R]un nearest' },
    { '<leader>tf', '<cmd>Neotest run file<cr>', desc = '[T]est run [F]ile' },
    { '<leader>ts', '<cmd>Neotest stop<cr>', desc = '[T]est [S]top nearest' },
    { '<leader>ta', '<cmd>Neotest attach<cr>', desc = '[T]est [A]ttach to nearest' },
    { '<leader>to', '<cmd>Neotest output<cr>', desc = '[T]est show [O]utput' },
    { '<leader>ts', '<cmd>Neotest summary<cr>', desc = '[T]est show [S]ummary' },

    { '[t', '<cmd>Neotest jump prev<cr>', desc = 'Go to previous [T]est' },
    { ']t', '<cmd>Neotest jump next<cr>', desc = 'Go to next [T]est' },
  },
  opts = function()
    return {
      adapters = {
        require 'neotest-golang',
        require 'neotest-dotnet',
      },
    }
  end,
}
