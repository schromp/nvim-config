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
        hidden = true,
        ignored = true
        -- your explorer picker configuration comes here
        -- or leave it empty to use the default settings
      }
    }
  }
})

vim.keymap.set("n", "<leader>e", function() require("snacks").explorer() end, { desc = "Snacks Explorer" })
