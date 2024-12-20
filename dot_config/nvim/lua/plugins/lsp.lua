local servers = {
  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        completeUnimported = true,
        staticcheck = true,
        gofumpt = true,
      },
    },
  },
  gofumpt = {},
  staticcheck = {},
  goimports = {},

  -- Python
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
  ruff = {},

  -- Lua
  lua_ls = {
    settings = {
      lua = {
        completion = {
          callsnippet = 'replace',
        },
      },
    },
  },
  stylua = {},
}

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim' },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    { 'folke/neodev.nvim', opts = {} },
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        local fzf = require 'fzf-lua'
        map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
        map('gr', fzf.lsp_references, '[G]oto [R]eferences')
        map('gI', fzf.lsp_implementations, '[G]oto [I]mplementation')

        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        map('K', vim.lsp.buf.hover, 'Hover Documentation')
      end,
    })

    local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

    require('mason').setup()
    require('mason-tool-installer').setup { ensure_installed = vim.tbl_keys(servers) }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}

          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
