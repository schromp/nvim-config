vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "v0.10.0"
  }
})

require('nvim-treesitter').setup({})

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
