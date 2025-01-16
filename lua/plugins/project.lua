return {
	"coffebar/neovim-project",
	enabled = true,
	keys = {
		{ "<leader>fp", "<cmd>NeovimProjectDiscover<cr>", desc = "Find projects" },
		{ "<leader>pt", "<cmd>NeovimProjectLoadRecent<cr>", desc = "Toggle to recent project" },
	},
	opts = {
		projects = { -- define project roots
			"~/Repos/*",
			-- "~/repos/*",
			"~/.config/nvim",
			"~/repos/bachelorarbeit/*",
			"~/repos/vaults/*",
		},
		last_session_on_startup = false,
		picker = {
			type = "fzf-lua",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
	end,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- { "nvim-telescope/telescope.nvim" }, -- Disabled because this config uses fzf-lua for now
		{ "ibhagwan/fzf-lua" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
}
