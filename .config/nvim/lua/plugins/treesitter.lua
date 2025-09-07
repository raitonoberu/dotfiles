return {
  'MeanderingProgrammer/treesitter-modules.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', branch = 'main' },
  opts = {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
