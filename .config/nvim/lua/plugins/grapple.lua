return {
  'cbochs/grapple.nvim',
  cmd = 'Grapple',
  keys = {
    { '<leader><Tab>', '<cmd>Grapple tag<cr>', desc = 'Grapple tag file' },
    { '<Tab>', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },

    { '[g', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Go to previous [G]rapple tag' },
    { ']g', '<cmd>Grapple cycle_tags next<cr>', desc = 'Go to next [G]rapple tag' },

    { '<A-1>', '<cmd>Grapple select index=1<cr>', desc = 'Select first tag' },
    { '<A-2>', '<cmd>Grapple select index=2<cr>', desc = 'Select second tag' },
    { '<A-3>', '<cmd>Grapple select index=3<cr>', desc = 'Select third tag' },
    { '<A-4>', '<cmd>Grapple select index=4<cr>', desc = 'Select fourth tag' },
    { '<A-5>', '<cmd>Grapple select index=5<cr>', desc = 'Select fifth tag' },
  },
  opts = {
    command = function(path)
      vim.g.disable_format = true
      vim.cmd 'silent update'
      vim.g.disable_format = false
      vim.cmd.edit(path)
    end,
  },
}
