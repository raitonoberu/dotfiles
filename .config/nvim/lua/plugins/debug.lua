return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    { 'igorlfs/nvim-dap-view', cmd = 'DapViewToggle' },

    { 'leoluz/nvim-dap-go', opts = {} },
    { 'nicholasmata/nvim-dap-cs', opts = {} },
  },
  keys = {
    { '<leader>ds', '<cmd>DapContinue<cr>', desc = '[D]ebug [S]tart' },
    { '<leader>di', '<cmd>DapStepInto<cr>', desc = '[D]ebug step [I]nto' },
    { '<leader>dv', '<cmd>DapStepOver<cr>', desc = '[D]ebug step o[v]er' },
    { '<leader>do', '<cmd>DapStepOut<cr>', desc = '[D]ebug step [O]ut' },
    { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = '[D]ebug toggle [B]reakpoint' },
    { '<leader>du', '<cmd>DapViewToggle<cr>', desc = '[D]ebug toggle [U]i' },
    { '<leader>dt', '<cmd>DapTerminate<cr>', desc = '[D]ebug [T]erminate' },
  },
  config = function()
    local dap = require 'dap'
    local ui = require 'dap-view'

    dap.listeners.after.event_initialized['ui'] = ui.open
    dap.listeners.before.event_terminated['ui'] = ui.close
    dap.listeners.before.event_exited['ui'] = ui.close
  end,
}
