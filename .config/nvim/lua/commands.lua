vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Delete trailing whitespace on save',
  callback = function()
    local save_cursor = vim.fn.getpos '.'
    pcall(function()
      vim.cmd [[%s/\s\+$//e]]
    end)
    vim.fn.setpos('.', save_cursor)
  end,
})

vim.api.nvim_create_user_command('W', function()
  vim.g.disable_format = true
  vim.cmd 'w'
  vim.g.disable_format = false
end, {
  desc = 'Save without formatting',
})
