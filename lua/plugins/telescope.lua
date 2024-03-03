return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("neovim-project")
		end,
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fa", "<cmd>Telescope live_grep<cr>", desc = "Find Files" },
		{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find Files" },
		{ "<leader>fu", "<cmd>Telescope grep_string<cr>", desc = "Find Files" },
		{ "<leader>fk", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>fp", "<cmd>Telescope neovim-project discover<cr>", desc = "Project picker" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { ".git/", "%.o", "%.a", "%.out" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				-- file_browser = {},
				require("telescope.themes").get_dropdown({
					-- even more opts
				}),
			},
		})
		-- require("telescope").load_extension("file_browser")
		-- require("telescope").load_extension("ui-select")
	end,
}
