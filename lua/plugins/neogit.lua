return {
	"TimUntersberger/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",

		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Toggle Neogit" },
    { "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview"},
    { "<leader>dq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview"},
    { "<leader>df", "<cmd>DiffviewFileHistory %<cr>", desc = "Show file history"},
	},
	enabled = true,
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			integrations = {
				diffview = true,
			},
			graph_style = "unicode",
		})
	end,
}
