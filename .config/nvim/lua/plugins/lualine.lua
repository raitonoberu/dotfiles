return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'cbochs/grapple.nvim',
  },
  opts = {
    sections = {
      lualine_b = {
        function()
          return require('grapple').statusline { include_icon = false }
        end,
      },
      lualine_c = { { 'filename', path = 3 } },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'branch', 'diff' },
    },
  },
}
