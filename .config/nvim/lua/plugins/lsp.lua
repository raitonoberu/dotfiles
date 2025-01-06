return {
  'neovim/nvim-lspconfig',
  event = 'VimEnter',
  dependencies = {
    'saghen/blink.cmp',

    -- mason
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- lua
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
      },
    },
    'Bilal2453/luvit-meta',

    -- dotnet
    {
      'seblj/roslyn.nvim',
      ft = 'cs',
      opts = {},
    },

    -- ui stuff
    { 'j-hui/fidget.nvim', opts = {} },
  },
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            completeUnimported = true,
            staticcheck = true,
          },
        },
      },
      pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              typeCheckingMode = 'off',
            },
          },
        },
      },
      lua_ls = {},
    },
    tools = { 'gofumpt', 'staticcheck', 'goimports', 'ruff', 'stylua', 'roslyn' },
  },
  keys = {
    { '<leader>rn', vim.lsp.buf.rename, desc = '[R]e[n]ame' },
    { '<leader>ca', vim.lsp.buf.code_action, desc = '[C]ode [A]ction' },
    { '<leader>K', vim.lsp.buf.hover, desc = 'Documentation' },
  },
  config = function(_, opts)
    for key, _ in pairs(opts.servers) do
      table.insert(opts.tools, key)
    end

    require('mason').setup()
    require('mason-lspconfig').setup()
    require('mason-tool-installer').setup { ensure_installed = opts.tools, run_on_start = false }

    local blink = require 'blink.cmp'
    local lspconfig = require 'lspconfig'
    for server, config in pairs(opts.servers) do
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
