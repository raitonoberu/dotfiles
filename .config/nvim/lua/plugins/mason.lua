return {
  'williamboman/mason.nvim',
  opts = {
    registries = {
      'github:mason-org/mason-registry',
      'github:Crashdummyy/mason-registry',
    },
  },
  init = function()
    local required = {
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
    }
    vim.api.nvim_create_user_command('MasonInstallAll', function()
      vim.cmd('MasonInstall ' .. table.concat(required, ' '))
    end, {})
  end,
}
