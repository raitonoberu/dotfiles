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

      LspReferenceText = { underline = true, inherit = false },
      LspReferenceRead = { underline = true, inherit = false },
      LspReferenceWrite = { underline = true, inherit = false },
    },
  },
  init = function()
    vim.cmd.colorscheme 'rose-pine'
    vim.cmd.hi 'MatchParen ctermfg=none guifg=none'
  end,
}
