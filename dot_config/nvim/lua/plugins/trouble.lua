return {
  'folke/trouble.nvim',
  keys = {
    {
      '<leader>tr',
      function()
        require('trouble').toggle 'diagnostics'
      end,
      desc = '[T]oggle t[r]ouble',
    },
    {
      ']t',
      function()
        ---@diagnostic disable-next-line: missing-parameter, missing-fields
        require('trouble').next { skip_groups = true, jump = true }
      end,
      desc = 'Next [t]rouble',
    },
    {
      '[t',
      function()
        ---@diagnostic disable-next-line: missing-parameter, missing-fields
        require('trouble').prev { skip_groups = true, jump = true }
      end,
      desc = 'Previous [t]rouble',
    },
  },
}
