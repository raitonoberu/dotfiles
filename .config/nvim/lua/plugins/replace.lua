return {
  'MagicDuck/grug-far.nvim',
  cmd = 'GrugFar',
  keys = {
    { '<leader>R', '<cmd>GrugFar<cr>', desc = '[R]eplace text' },
    { '<leader>R', mode = { 'x' }, ":'<,'>GrugFar<cr>", desc = '[R]eplace selected text' },
  },
}
