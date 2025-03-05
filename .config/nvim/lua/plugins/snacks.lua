return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    terminal = {
      win = { border = 'solid', relative = 'editor' },
    },
    lazygit = {},
    picker = {},
  },
  keys = {
    -- terminal
    { '<A-t>', '<cmd>lua Snacks.terminal.toggle(vim.o.shell)<cr>', mode = { 'n', 't' }, desc = 'Toggle terminal' },

    -- lazigit
    { '<A-g>', '<cmd>lua Snacks.lazygit()<cr>', mode = { 'n', 't' }, desc = 'Toggle lazygit' },

    -- picker
    { '<leader><leader>', '<cmd>lua Snacks.picker.grep()<cr>', desc = '[ ] Live Grep' },
    { '<leader>sf', '<cmd>lua Snacks.picker.files()<cr>', desc = '[S]earch [F]iles' },
    { '<leader>sw', '<cmd>lua Snacks.picker.grep_word()<cr>', desc = '[S]earch [W]ord', mode = { 'n', 'x' } },
    { '<leader>sr', '<cmd>lua Snacks.picker.resume()<cr>', desc = '[S]earch [R]esume' },
    { '<leader>sd', '<cmd>lua Snacks.picker.diagnostics()<cr>', desc = '[S]earch [D]iagnostics' },
    { '<leader>ss', '<cmd>lua Snacks.picker.lsp_symbols()<cr>', desc = '[S]earch [S]ymbols' },
    { '<leader>sg', '<cmd>lua Snacks.picker.git_diff()<cr>', desc = '[S]earch [G]it diff' },
    { '<leader>/', '<cmd>lua Snacks.picker.lines()<cr>', desc = '[/] Search Buffer' },
    { 'gd', '<cmd>lua Snacks.picker.lsp_definitions()<cr>', desc = '[G]oto [D]efinition' },
    { 'gr', '<cmd>lua Snacks.picker.lsp_references()<cr>', desc = '[G]oto [R]eferences' },
    { 'gi', '<cmd>lua Snacks.picker.lsp_implementations()<cr>', desc = '[G]oto [I]mplementation' },
  },
}
