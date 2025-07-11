return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	opts = {},
	config = function(_, opts)
    -- INFO: mini.diff is enabled in code-companion.nvim
		require("mini.pairs").setup()
		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
		})

		require("mini.align").setup()
		require("mini.indentscope").setup({
			draw = {
				delay = 10,
				animation = require("mini.indentscope").gen_animation.none(),
				symbol = "│",
			},
		})
		require("mini.comment").setup()
		require("mini.cursorword").setup()
	end,
}
