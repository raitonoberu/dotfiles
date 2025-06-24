return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    opts = {
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    },
  },
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

      -- other
      'prettier',
    },
    run_on_start = false,
  },
}
