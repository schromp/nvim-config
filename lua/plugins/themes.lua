vim.pack.add({
	"https://github.com/rose-pine/neovim",
	"https://github.com/bluz71/vim-moonfly-colors",
	"https://github.com/kdheepak/monochrome.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/scottmckendry/cyberdream.nvim",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/loctvl842/monokai-pro.nvim",
  "https://github.com/datsfilipe/vesper.nvim",
})

require("rose-pine").setup({
	-- styles = {
	-- 	transparency = true,
	-- },
})

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
})

vim.cmd("colorscheme catppuccin-nvim")
