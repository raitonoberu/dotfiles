return {
  'axkirillov/easypick.nvim',
  cmd = 'Easypick',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('easypick').setup {
      pickers = {
        {
          name = 'diff',
          command = 'git diff --name-only 2> /dev/null',
          previewer = require('telescope.previewers').vim_buffer_cat.new {},
        },
      },
    }
  end,
}
