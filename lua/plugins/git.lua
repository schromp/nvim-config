vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/sindrets/diffview.nvim',
})


require('neogit').setup {
  integrations = {
    diffview = true
  },
  diff_viewer = 'diffview'
}

vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { noremap = true, silent = true })
