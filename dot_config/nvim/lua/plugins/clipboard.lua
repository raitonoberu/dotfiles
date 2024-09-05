return {
  'AckslD/nvim-neoclip.lua',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  event = 'VimEnter',
  opts = {},
  keys = {
    {
      '<leader>sc',
      function()
        require('telescope').extensions.neoclip.default()
      end,
    },
  },
}
