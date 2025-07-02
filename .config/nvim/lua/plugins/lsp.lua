return {
  'neovim/nvim-lspconfig',
  event = 'VimEnter',
  dependencies = {
    'saghen/blink.cmp',

    -- ui stuff
    { 'j-hui/fidget.nvim', opts = {} },

    -- lua
    { 'folke/lazydev.nvim', ft = 'lua', opts = { library = { { path = 'luvit-meta/library', words = { 'vim%.uv' } } } } },
    'Bilal2453/luvit-meta',

    -- dotnet
    { 'seblj/roslyn.nvim', ft = 'cs', opts = {} },

    -- typescript
    {
      'pmizio/typescript-tools.nvim',
      ft = 'ts',
      opts = {
        on_attach = function(client)
          client.server_capabilities.semanticTokensProvider = false
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
    },
  },
  opts = {
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
    zls = {
      enable_build_on_save = true,
      semantic_tokens = 'partial',
    },
    clangd = {},
  },
  keys = {
    { '<leader>r', vim.lsp.buf.rename, desc = '[R]ename' },
    { '<leader>a', vim.lsp.buf.code_action, desc = '[A]ction' },
  },
  config = function(_, servers)
    local blink = require 'blink.cmp'
    local lspconfig = require 'lspconfig'

    for server, config in pairs(servers) do
      config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
