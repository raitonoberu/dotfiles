---@diagnostic disable: undefined-global
local tab = '    '

local function guess_namespace()
  local current_dir = vim.fn.expand '%:p:h'
  if current_dir == '' then
    return
  end

  local files = vim.fn.glob(current_dir .. '/*.cs', false, true)
  for _, file in ipairs(files) do
    local _, lines = pcall(vim.fn.readfile, file)
    for _, line in ipairs(lines or {}) do
      local ns = line:match '^%s*namespace%s+([%w_.]+)'
      if ns then
        return ns
      end
    end
  end
end

return {
  postfix({
    trig = ' :=',
    snippetType = 'autosnippet',
  }, {
    l('var ' .. l.POSTFIX_MATCH .. ' ='),
  }),

  s('nms', {
    t 'namespace ',
    d(1, function()
      local ns = guess_namespace()
      return ns and sn(nil, { t(ns) }) or sn(nil, { i(1, '') })
    end),
    t { ';', '', '' },
    i(0),
  }),

  s('cls', {
    t 'public class ',
    sn(nil, { p(vim.fn.expand, '%:t:r') }, { key = 'name' }),
    t '(',
    i(1),
    t { ')', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('rcd', {
    t 'public record ',
    p(vim.fn.expand, '%:t:r'),
    t { '(', tab },
    i(0),
    t { '', ');' },
  }),

  s('meth', {
    i(4, 'public'),
    t ' ',
    i(3, 'void'),
    t ' ',
    i(1, 'Method'),
    t '(',
    i(2),
    t { ')', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('srv', {
    t 'public class ',
    sn(nil, { p(vim.fn.expand, '%:t:r') }, { key = 'name' }),
    t '(ILog log',
    i(1),
    t { ')', '{', tab .. 'private readonly ILog log = log.ForContext<' },
    rep(k 'name'),
    t { '>();', '', tab },
    i(0),
    t { '', '}' },
  }),

  s('ameth', {
    i(4, 'public'),
    t ' async Task<ApiOperationResult',
    c(3, {
      i(1),
      sn(nil, { t '<', i(1, 'object'), t '>' }),
    }),
    t '> ',
    i(1, 'Method'),
    t '(',
    i(2),
    t { ')', '{', tab },
    i(0, 'return ApiOperationResult.Success();'),
    t { '', '}' },
  }),

  s('ares', {
    t 'var ',
    i(3, 'result', { key = 'var' }),
    t ' = await ',
    i(1, 'Method'),
    t '(',
    i(2),
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

  s('iferr', {
    t 'if (',
    i(1, 'result'),
    t { '.IsFail)', tab .. 'return ' },
    rep(1),
    t { '.Error;', '' },
    i(0),
  }),

  s('fix', {
    t { '[TestFixture]', 'public class ' },
    p(vim.fn.expand, '%:t:r'),
    t { '', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('test', {
    t { '[Test]', 'public void Should_' },
    i(1),
    t { '()', '{', tab },
    i(0),
    t { '', '}' },
  }),

  s('atest', {
    t { '[Test]', 'public async Task Should_' },
    i(1),
    t { '()', '{', tab },
    i(0),
    t { '', '}' },
  }),
}
