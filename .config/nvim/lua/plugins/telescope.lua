return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',

    'nvim-telescope/telescope-ui-select.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'AckslD/nvim-neoclip.lua', opts = {} },
  },
  config = function()
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'neoclip')
  end,
  keys = {
    { '<leader><leader>', '<cmd>Telescope live_grep<cr>', desc = '[ ] Live Grep' },
    { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [F]iles' },
    { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch [W]ord' },
    { '<leader>sr', '<cmd>Telescope resume<cr>', desc = '[S]earch [R]esume' },
    { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
    { '<leader>sc', '<cmd>Telescope neoclip<cr>', desc = '[S]earch [C]lipboard' },
    { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = '[/] Search Buffer' },

    { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = '[G]oto [D]efinition' },
    { 'gr', '<cmd>Telescope lsp_references<cr>', desc = '[G]oto [R]eferences' },
    { 'gi', '<cmd>Telescope lsp_implementations<cr>', desc = '[G]oto [I]mplementation' },
  },
}
