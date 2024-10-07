return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_b = {
        function()
          return require('grapple').statusline {
            include_icon = false,
          }
        end,
      },
      lualine_x = {
        'diagnostics',
      },
      lualine_y = {
        'branch',
        'diff',
      },
    },
  },
}
