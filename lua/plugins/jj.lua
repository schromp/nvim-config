vim.pack.add({"https://github.com/NicholasZolton/NeoJJ"})

local neojj = require('neojj')

neojj.setup {
}

vim.keymap.set("n", "<leader>jj", neojj.open, { desc = "Open Neojj UI" })
