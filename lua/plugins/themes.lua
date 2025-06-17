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
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
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
    end
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
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- NormalFloat = { bg = "none" },
						-- FloatBorder = { bg = "none" },
						-- FloatTitle = { bg = "none" },
						--
						-- -- Save an hlgroup with dark background and dimmed foreground
						-- -- so that you can use it where your still want darker windows.
						-- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
						-- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						--
						-- -- Popular plugins that open floats will link to NormalFloat by default;
						-- -- set their background accordingly if you wish to keep them dark and borderless
						-- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						-- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						--
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					}
				end,
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
				borderless_telescope = true,
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
    "thedenisnikulin/vim-cyberpunk"
  }
}
