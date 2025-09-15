return {
	{
		"navarasu/onedark.nvim",
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		-- opts = { style = "moon", transparent = DynConfig.transparent },
		config = function()
			require("tokyonight").setup({
				style = "moon",
				transparent = DynConfig.transparent,
			})
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = DynConfig.transparent, -- disables setting the background color.
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			-- vim.opt.background = "light"
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			local rpVariant
			if DynConfig.theme == "rose-pine-dawn" then
				rpVariant = "dawn"
			elseif DynConfig.theme == "rose-pine-moon" then
				rpVariant = "night"
			elseif DynConfig.theme == "rose-pine-main" then
				rpVariant = "moon"
			else
				rpVariant = "auto"
			end
			require("rose-pine").setup({
				variant = rpVariant,
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		config = function()
			require("kanagawa").setup({
				transparent = false,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})
		end,
	},
	{
		"eldritch-theme/eldritch.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Recommended - see "Configuring" below for more config options
				transparent = false,
				italic_comments = true,
				hide_fillchars = true,
				borderless_pickers = true,
				terminal_colors = true,
			})
		end,
	},
	{
		"diegoulloao/neofusion.nvim",
	},
	{
		"Mofiqul/dracula.nvim",
	},
	{
		"thedenisnikulin/vim-cyberpunk",
	},
	{
		"neanias/everforest-nvim",
		config = function()
			require("everforest").setup({
				transparent_background_level = 1,
			})
		end,
	},
	{
		"darkvoid-theme/darkvoid.nvim",
	},
	{
		"shaunsingh/nord.nvim",
	},
	{
		"sainnhe/sonokai",
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
}
