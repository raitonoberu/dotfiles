return {
  'rose-pine/neovim',
  name = 'rose-pine',
  lazy = false,
  priority = 1000,
  opts = {
    highlight_groups = {
      RainbowDelimiterRed = { fg = 'love' },
      RainbowDelimiterGreen = { fg = 'pine' },
      RainbowDelimiterYellow = { fg = 'gold' },
      RainbowDelimiterBlue = { fg = 'foam' },
      RainbowDelimiterOrange = { fg = 'rose' },
      RainbowDelimiterViolet = { fg = 'iris' },
    },
  },
  init = function()
    vim.cmd.colorscheme 'rose-pine'
    vim.cmd.hi 'MatchParen ctermfg=none guifg=none'
  end,
}
