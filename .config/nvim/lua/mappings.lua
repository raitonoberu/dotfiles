local map = vim.keymap.set

-- Clear highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
map('n', '[d', function()
  vim.diagnostic.jump { count = -1 }
end)
map('n', ']d', function()
  vim.diagnostic.jump { count = 1 }
end)

-- Quickfix
map('n', '[[', '<cmd>cprev<CR>')
map('n', ']]', '<cmd>cnext<CR>')

-- Exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Center cursor when scrolling / searching
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Actions without replacing register
map('x', '<leader>p', [["_dP]])
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])
map({ 'n', 'v' }, '<leader>d', [["_d]])

-- Disable tab for jump forward
map('n', '<C-i>', '<C-i>')
map('n', '<Tab>', '<nop>')
