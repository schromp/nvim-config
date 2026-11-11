-- The plugin is added by plugins.util; install missing parsers only.
local treesitter = require('nvim-treesitter')
treesitter.setup({})
treesitter.install({ 'markdown', 'markdown_inline', 'typescript', 'tsx', 'javascript' })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('code-highlighting', { clear = true }),
  pattern = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'markdown' },
  callback = function(event)
    -- Parsers may still be installing on the first startup.
    pcall(vim.treesitter.start, event.buf)
  end,
})

vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
callback = function()
  require('nvim-treesitter.parsers').jsonc = {
    install_info = {
      url = 'https://gitlab.com/WhyNotHugo/tree-sitter-jsonc',
      -- revision = 'v0.3.0', -- commit hash for revision to check out; HEAD if missing
      -- optional entries:
      -- branch = 'develop', -- only needed if different from default branch
      -- location = 'parser', -- only needed if the parser is in subdirectory of a "monorepo"
      -- generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
      -- generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
      -- queries = 'queries/neovim', -- also install queries from given directory
    },
  }
end})
--
-- vim.treesitter.language.register('jsonc', { 'json' })
