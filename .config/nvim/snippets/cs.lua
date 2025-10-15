---@diagnostic disable: undefined-global
local tab = '    '

return {
  s('cls', { -- class
    c(1, { t 'public', t 'private' }),
    t ' class ',
    sn(nil, { p(vim.fn.expand, '%:t:r') }, { key = 'name' }),
    t '(ILog log',
    i(2),
    t { ')', '{', tab .. 'private readonly ILog log = log.ForContext<' },
    rep(k 'name'),
    t { '>();', '', tab },
    i(0),
    t { '', '}' },
  }),

  s('ame', { -- async method
    c(1, { t 'public', t 'private' }),
    t ' async Task<ApiOperationResult',
    c(2, {
      t '',
      sn(nil, { t '<', i(1, 'object'), t '>' }),
    }),
    t '> ',
    i(3, 'Method'),
    t '(',
    i(4),
    t { ')', '{', tab },
    i(0, 'return ApiOperationResult.Success();'),
    t { '', '}' },
  }),

  s('are', { -- async result
    t 'var ',
    i(1, 'result', { key = 'var' }),
    t ' = await ',
    i(2, 'Method'),
    t '(',
    i(3),
    t { ');', 'if (' },
    rep(k 'var'),
    t { '.IsFail)', '' },

    c(4, {
      sn(nil, {
        i(1),
        t { tab .. 'return ' },
        rep(k 'var'),
        t { '.Error;', '' },
      }),

      sn(nil, {
        t { '{', tab },
        i(1),
        t { '', tab .. 'return ' },
        rep(k 'var'),
        t { '.Error;', '}', '' },
      }),
    }),

    i(0),
  }),
}
