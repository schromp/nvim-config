vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
})

-- Resolve the root after the file has opened, when the selected buffer is current.
local function open_in_project(action)
  return function(selected, opts)
    action(selected, opts)
    -- Multiple selections keep fzf-lua's quickfix behavior.
    if #selected ~= 1 or vim.bo.buftype ~= '' then
      return
    end
    local project = require('project')
    local root, method = project.get_project_root()
    if root then
      project.set_pwd({ dir = root, method = method or 'fzf-lua' })
    end
  end
end

local function project_actions()
  local actions = require('fzf-lua.actions')
  return {
    ['enter'] = open_in_project(actions.file_edit_or_qf),
    ['ctrl-s'] = open_in_project(actions.file_split),
    ['ctrl-v'] = open_in_project(actions.file_vsplit),
    ['ctrl-t'] = open_in_project(actions.file_tabedit),
  }
end

vim.keymap.set('n', '<leader>pF', function()
  require('fzf-lua').files({
    cwd = vim.fn.expand('~/repos'),
    hidden = true,
    prompt = 'Files across projects> ',
    actions = project_actions(),
  })
end, { desc = 'Find file across ~/repos projects' })

vim.keymap.set('n', '<leader>p/', function()
  require('fzf-lua').live_grep({ cwd = vim.fn.getcwd(), actions = project_actions() })
end, { desc = 'Search text in project' })

vim.keymap.set('n', '<leader>f', function()
  require('fzf-lua').files({ cwd = vim.fn.getcwd() })
end, { desc = 'Open File Picker' })

vim.keymap.set('n', '<leader>b', function()
  require('fzf-lua').buffers({ cwd = vim.fn.getcwd(), cwd_only = true })
end, { desc = 'Buffers in current project' })

vim.keymap.set('n', '<leader>B', function()
  require('fzf-lua').buffers({ cwd = false, cwd_only = false, actions = project_actions() })
end, { desc = 'All buffers' })

vim.keymap.set('n', '<leader>/', function()
  require('fzf-lua').live_grep({ cwd = vim.fn.getcwd(), actions = project_actions() })
end, { desc = 'Open Grep Picker' })
