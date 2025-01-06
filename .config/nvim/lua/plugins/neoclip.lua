return {
  'AckslD/nvim-neoclip.lua',
  event = 'VimEnter',
  opts = {},
  keys = {
    {
      '<leader>sc',
      function()
        require('telescope').extensions.neoclip.default()
      end,
      desc = '[S]earch [C]lipboard',
    },
  },
}
