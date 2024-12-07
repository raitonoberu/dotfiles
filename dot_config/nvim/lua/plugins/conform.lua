return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    format_on_save = function()
      if not vim.g.disable_format then
        return { lsp_format = 'fallback', timeout_ms = 500 }
      end
    end,
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
