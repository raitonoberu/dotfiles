return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    terminal = {
      win = { border = 'solid', relative = 'editor' },
    },
    lazygit = {},
    input = {},
  },
  keys = {
    { '<A-t>', "<cmd>lua require('snacks').terminal.toggle(vim.o.shell)<cr>", mode = { 'n', 't' }, desc = 'Toggle terminal' },
    { '<A-g>', "<cmd>lua require('snacks').lazygit()<cr>", mode = { 'n', 't' }, desc = 'Toggle lazygit' },
  },
}
