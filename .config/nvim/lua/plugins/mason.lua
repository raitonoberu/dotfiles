return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'williamboman/mason.nvim', opts = {} },
  opts = {
    ensure_installed = {
      -- go
      'gopls',
      'gofumpt',
      'staticcheck',
      'goimports',
      'delve',

      -- python
      'pyright',
      'ruff',

      -- lua
      'lua-language-server',
      'stylua',

      -- dotnet
      'roslyn',
      'netcoredbg',
    },
    run_on_start = false,
  },
}
