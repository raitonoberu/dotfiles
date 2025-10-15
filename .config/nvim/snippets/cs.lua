---@diagnostic disable: undefined-global
local tab = '    '

local function filename()
  return vim.fn.expand '%:t:r'
end

return {
  s('cls', {
    i(1, 'public'),
    t ' class ',
    f(filename),
    t '(ILog log',
    i(2),
    t { ')', '{', tab .. 'private readonly ILog log = log.ForContext<' },
    f(filename),
    t { '>();', '', tab },
    i(0),
    t { '', '}' },
  }),

  s('ame', {
    i(1, 'public'),
    t ' async Task<ApiOperationResult',
    i(2),
    t '> ',
    i(3, 'Method'),
    t '(',
    i(4),
    t { ')', '{', tab },
    i(0),
    t { '', '}' },
  }),
}
