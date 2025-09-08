local nav = function(index)
  return function()
    require('harpoon-core').nav_file(index)
  end
end

return {
  'MeanderingProgrammer/harpoon-core.nvim',
  opts = {},
  keys = {
    {
      '<leader><Tab>',
      function()
        require('harpoon-core').add_file()
      end,
    },
    {
      '<Tab>',
      function()
        require('harpoon-core').toggle_quick_menu()
      end,
    },
    { '<A-1>', nav(1) },
    { '<A-2>', nav(2) },
    { '<A-3>', nav(3) },
    { '<A-4>', nav(4) },
    { '<A-5>', nav(5) },
  },
}
