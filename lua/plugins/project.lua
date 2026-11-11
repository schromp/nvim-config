vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/DrKJeff16/project.nvim',
})

require('project').setup({
  manual_mode = false,
  scope_chdir = 'global',
  patterns = { '.projectile', '.jj', '>repos' },
  fzf_lua = { enabled = true },
})

-- The upstream fzf-lua action sets only the picker's cwd, not Neovim's cwd.
vim.keymap.set('n', '<leader>pp', function()
  local project = require('project')
  local paths = project.get_recent_projects(true)
  require('fzf-lua').fzf_exec(paths, {
    prompt = 'Projects> ',
    actions = {
      ['default'] = function(selected)
        if not selected or not selected[1] then
          return
        end
        local dir = selected[1]
        if project.set_pwd({ dir = dir, method = 'fzf-lua' }) then
          require('fzf-lua').files({ cwd = dir })
        end
      end,
    },
  })
end, { desc = 'Switch project and find file' })

