return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	opts = {},
	config = function(_, opts)
		require("mini.pairs").setup()
		require("mini.surround").setup()

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
