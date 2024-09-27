return {
	"hedyhli/outline.nvim",
	keys = {
		{ "<leader>o", "<cmd>Outline<cr>", desc = "Toggle Outline" },
	},
	config = function()
		require("outline").setup({
			position = "left",
		})
	end,
}
