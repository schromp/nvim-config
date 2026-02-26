vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/NeogitOrg/neogit'
})

require('neogit').setup {
}

vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { noremap = true, silent = true })
