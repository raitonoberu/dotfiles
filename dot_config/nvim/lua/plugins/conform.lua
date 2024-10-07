return {
  'stevearc/conform.nvim',
  event = 'VimEnter',
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_fix', 'ruff_format' },
      javascript = { 'prettier' },
      html = { 'prettier' },
      json = { 'prettier ' },
      fish = { 'fish_indent' },
      go = { 'gofumpt' },
    },
  },
}
