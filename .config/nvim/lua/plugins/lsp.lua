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
    ts_ls = {},
    zls = {},
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
