vim.pack.add({"https://github.com/folke/snacks.nvim"})

require("snacks").setup({
  explorer = {
    -- your explorer configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  picker = {
    layout = {
      preset = "ivy",
    },
    sources = {
      explorer = {
        -- your explorer picker configuration comes here
        -- or leave it empty to use the default settings
      }
    }
  }
})

vim.keymap.set("n", "<leader>e", function() require("snacks").explorer() end, { desc = "Snacks Explorer" })
vim.keymap.set("n", "<leader>f", function () require("snacks").picker.files() end, { desc = "Open File Picker" })
vim.keymap.set("n", "<leader>b", function () require("snacks").picker.buffers() end, { desc = "Open Buffer Picker" })
vim.keymap.set("n", "<leader>/", function () require("snacks").picker.grep() end, { desc = "Open Grep Picker" })
