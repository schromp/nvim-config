vim.pack.add({
  "https://github.com/rose-pine/neovim",
  "https://github.com/bluz71/vim-moonfly-colors",
  "https://github.com/kdheepak/monochrome.nvim",
  "https://github.com/catppuccin/nvim"
})

require("rose-pine").setup({
  styles = {
    transparency = true,
  }
})

require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
})

vim.cmd("colorscheme catppuccin-nvim")
