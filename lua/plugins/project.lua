return {
	"coffebar/neovim-project",
	enabled = false,
	opts = {
		projects = { -- define project roots
			"~/Repos/indi/*",
			"~/Repos/cruises/*",
			"~/Repos/non-essential/*",
			"~/Repos/*",
			"~/repos/*",
      "~/.config/nvim",
			"~/repos/bachelorarbeit/*",
			"~/repos/vaults/*",
		},
		last_session_on_startup = true,
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
