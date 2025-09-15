local mason_packages = {
  'delve',
  'gofumpt',
  'goimports',
  'gopls',
  'lua-language-server',
  'netcoredbg',
  'prettier',
  'pyright',
  'roslyn',
  'ruff',
  'stylua',
}

local lsp_servers = {
  'gopls',
  'lua_ls',
  'pyright',
}

local formatters = {
  go = { 'gofumpt', 'goimports' },
  html = { 'prettier' },
  javascript = { 'prettier' },
  javascriptreact = { 'prettier' },
  json = { 'prettier ' },
  lua = { 'stylua' },
  python = { 'ruff_fix', 'ruff_format' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
}

local mini_path = vim.fn.stdpath 'data' .. '/site/pack/deps/start/mini.nvim'
if not vim.uv.fs_stat(mini_path) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/nvim-mini/mini.nvim',
    mini_path,
  }
  vim.cmd 'packadd mini.nvim'
end
require('mini.deps').setup()

local add = MiniDeps.add
local map = vim.keymap.set

-- colorscheme
add { source = 'rose-pine/neovim', name = 'rose-pine' }
vim.cmd.colorscheme 'rose-pine'

-- mini
add 'nvim-mini/mini.nvim'
require('mini.ai').setup()
require('mini.basics').setup { mappings = { windows = true } }
require('mini.clue').setup()
require('mini.comment').setup()
require('mini.cursorword').setup { delay = 400 }
require('mini.diff').setup()
require('mini.git').setup()
require('mini.jump').setup()
require('mini.move').setup()

-- statusline
add { source = 'nvim-lualine/lualine.nvim', depends = { 'nvim-tree/nvim-web-devicons' } }
require('lualine').setup {
  sections = {
    lualine_b = {},
    lualine_c = { { 'filename', path = 3 } },
    lualine_x = {},
    lualine_y = { 'branch', 'diff' },
  },
}

-- treesitter
add { source = 'nvim-treesitter/nvim-treesitter', checkout = 'main' }
add 'MeanderingProgrammer/treesitter-modules.nvim'
require('treesitter-modules').setup {
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

-- file explorer
add 'stevearc/oil.nvim'
require('oil').setup {
  watch_for_changes = true,
  keymaps = { ['<C-l>'] = false, ['<C-t>'] = false },
  view_options = { show_hidden = true },
}
map('n', '<A-d>', '<cmd>Oil<CR>')

-- harpoon
add 'MeanderingProgrammer/harpoon-core.nvim'
local harpoon = require 'harpoon-core'
harpoon.setup()
map('n', '<leader><Tab>', harpoon.add_file)
map('n', '<Tab>', harpoon.toggle_quick_menu)
for i = 1, 5 do
  map('n', '<A-' .. i .. '>', function()
    harpoon.nav_file(i)
  end)
end

-- formatting
add 'stevearc/conform.nvim'
require('conform').setup {
  format_on_save = function()
    if not vim.g.disable_format then
      return { lsp_format = 'fallback', timeout_ms = 500 }
    end
  end,
  formatters_by_ft = formatters,
}

vim.api.nvim_create_user_command('W', function()
  vim.g.disable_format = true
  vim.cmd 'w'
  vim.g.disable_format = false
end, {})

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    if vim.g.disable_format then
      return
    end
    local save_cursor = vim.fn.getpos '.'
    pcall(function()
      vim.cmd [[%s/\s\+$//e]]
    end)
    vim.fn.setpos('.', save_cursor)
  end,
})

-- mason
add 'williamboman/mason.nvim'
require('mason').setup {
  registries = {
    'github:mason-org/mason-registry',
    'github:Crashdummyy/mason-registry',
  },
}
vim.api.nvim_create_user_command('MasonInstallAll', function()
  vim.cmd('MasonInstall ' .. table.concat(mason_packages, ' '))
end, {})

-- snacks
add 'folke/snacks.nvim'
require('snacks').setup {
  picker = {},
  lazygit = {},
  terminal = { win = { style = 'float', border = 'solid' } },
}

local picker = Snacks.picker
map({ 'n', 'x' }, '<leader><leader>', picker.grep)
map('n', '<leader>sf', picker.files)
map('n', '<leader>sw', picker.grep_word)
map('n', '<leader>sr', picker.resume)
map('n', '<leader>sd', picker.diagnostics)
map('n', '<leader>sg', picker.git_diff)
map('n', 'gd', picker.lsp_definitions)
map('n', 'gr', picker.lsp_references)
map('n', 'gi', picker.lsp_implementations)

map({ 'n', 't' }, '<A-g>', Snacks.lazygit.open)
map({ 'n', 't' }, '<A-t>', Snacks.terminal.toggle)
map('t', '<Esc><Esc>', '<C-\\><C-n>')

-- lsp
add 'neovim/nvim-lspconfig'
add 'seblyng/roslyn.nvim'
add { source = 'pmizio/typescript-tools.nvim', depends = { 'nvim-lua/plenary.nvim' } }
require('typescript-tools').setup {
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}

vim.lsp.enable(lsp_servers)
vim.diagnostic.config {
  jump = { float = true },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  float = { close_events = { 'CursorMoved', 'BufHidden', 'LspDetach' } },
}

map('n', '<leader>r', vim.lsp.buf.rename)
map('n', '<leader>a', vim.lsp.buf.code_action)

-- blink
add {
  source = 'saghen/blink.cmp',
  depends = { 'rafamadriz/friendly-snippets' },
  checkout = 'v1.6.0',
}
require('blink.cmp').setup {
  keymap = {
    ['<C-h>'] = { 'snippet_backward', 'fallback' },
    ['<C-l>'] = { 'snippet_forward', 'fallback' },
  },
  completion = { documentation = { auto_show = true } },
  signature = { enabled = true },
  appearance = { nerd_font_variant = 'normal' },
}

-- tests
add {
  source = 'nvim-neotest/neotest',
  depends = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    'fredrikaverpil/neotest-golang',
    'nsidorenco/neotest-vstest',
  },
}
require('neotest').setup {
  adapters = {
    require 'neotest-golang',
    require 'neotest-vstest' { dap_settings = { type = 'coreclr' } },
  },
}
map('n', '<leader>ts', '<cmd>Neotest summary<cr>')
map('n', '<leader>tr', '<cmd>Neotest run<cr>')
map('n', '<leader>tf', '<cmd>Neotest run file<cr>')
map('n', '<leader>ta', '<cmd>Neotest attach<cr>')
map('n', '<leader>to', '<cmd>Neotest output<cr>')
map('n', '<leader>tq', '<cmd>Neotest stop<cr>')
map('n', '[t', '<cmd>Neotest jump prev<cr>')
map('n', ']t', '<cmd>Neotest jump next<cr>')

-- debug
add {
  source = 'mfussenegger/nvim-dap',
  depends = {
    'leoluz/nvim-dap-go',
    'nicholasmata/nvim-dap-cs',
  },
}
add 'igorlfs/nvim-dap-view'
require('dap-go').setup()
require('dap-cs').setup()

map('n', '<leader>ds', '<cmd>DapViewToggle<cr>')
map('n', '<leader>dr', '<cmd>DapContinue<cr>')
map('n', '<leader>di', '<cmd>DapStepInto<cr>')
map('n', '<leader>dv', '<cmd>DapStepOver<cr>')
map('n', '<leader>do', '<cmd>DapStepOut<cr>')
map('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
map('n', '<leader>dq', '<cmd>DapTerminate<cr>')

-- indent
add 'tpope/vim-sleuth'

-- autopairs
add 'windwp/nvim-autopairs'
require('nvim-autopairs').setup()

-- quickfix
add 'yorickpeterse/nvim-pqf'
require('pqf').setup()

-- todo comments
add { source = 'folke/todo-comments.nvim', depends = { 'nvim-lua/plenary.nvim' } }
require('todo-comments').setup()

-- misc mappings
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map({ 'n', 'x' }, '<leader>d', [["_d]])
map('x', '<leader>p', [["_dP]])
map({ 'n', 'x' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

-- misc settings
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.updatetime = 150
