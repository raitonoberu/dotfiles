return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    { 'rcarriga/nvim-dap-ui', opts = {} },

    { 'leoluz/nvim-dap-go', opts = { delve = { detached = vim.fn.has 'win32' == 0 } } },
    { 'nicholasmata/nvim-dap-cs', opts = {} },
  },
  keys = {
    { '<leader>ds', '<cmd>DapContinue<cr>', desc = '[D]ebug [S]tart' },
    { '<leader>di', '<cmd>DapStepInto<cr>', desc = '[D]ebug step [I]nto' },
    { '<leader>dv', '<cmd>DapStepOver<cr>', desc = '[D]ebug step o[v]er' },
    { '<leader>do', '<cmd>DapStepOut<cr>', desc = '[D]ebug step [O]ut' },
    { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = '[D]ebug toggle [B]reakpoint' },
    { '<leader>dr', '<cmd>DapToggleRepl<cr>', desc = '[D]ebug toggle [R]epl' },
    { '<leader>du', "<cmd>lua require('dapui').toggle()<cr>", desc = '[D]ebug toggle [U]i' },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}
