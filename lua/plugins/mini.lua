return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return vim.bo.commentstring
				end,
			},
		})
		-- require('mini.completion').setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
	end,
}
