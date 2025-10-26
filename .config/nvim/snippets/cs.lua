---@diagnostic disable: undefined-global
local tab = '    '

return {
  s('class', { -- class
    i(1, 'public'),
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

  s('record', { -- record
    i(1, 'public'),
    t ' record ',
    p(vim.fn.expand, '%:t:r'),
    t { '(', tab },
    i(0),
    t { '', ');' },
  }),

  s('method', { -- method
    i(1, 'public'),
    t ' ',
    i(2, 'void'),
    t ' ',
    i(3, 'Method'),
    t '(',
    i(4),
    t { ')', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('amethod', { -- async method
    i(1, 'public'),
    t ' async Task<ApiOperationResult',
    c(2, {
      i(1),
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

  s('result', { -- result
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
        t 'log.Error("Failed to ',
        i(1),
        t ': {0}", error);',
        t { '', tab .. 'return ' },
        rep(k 'var'),
        t { '.Error;', '}', '' },
      }),
    }),

    i(0),
  }),

  s('iferr', { -- if error
    t 'if (',
    i(1, 'result'),
    t { '.IsFail)', tab .. 'return ' },
    rep(1),
    t { '.Error;', '' },
    i(0),
  }),

  s('fixture', { -- fixture
    t { '[TestFixture]', 'public class ' },
    p(vim.fn.expand, '%:t:r'),
    t { '', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('test', { -- test
    t { '[Test]', 'public void Should_' },
    i(1),
    t { '()', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('atest', { -- async test
    t { '[Test]', 'public async Task Should_' },
    i(1),
    t { '()', '{', tab },
    i(0),
    t { '', '}' },
  }),
}
