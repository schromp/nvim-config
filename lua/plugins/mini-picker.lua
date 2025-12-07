vim.pack.add({"https://github.com/nvim-mini/mini.pick"})

local pick = require("mini.pick")
pick.setup({})

vim.keymap.set("n", "<leader>f", pick.builtin.files, { desc = "Open File Picker" })
vim.keymap.set("n", "<leader>b", pick.builtin.buffers, { desc = "Open Buffer Picker" })
vim.keymap.set("n", "<leader>/", pick.builtin.grep_live, { desc = "Open Grep Picker" })
