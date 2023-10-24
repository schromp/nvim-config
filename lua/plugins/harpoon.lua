return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add file to Harpoon",
		},
		{
			"<leader>hh",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle Harpoon Menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
		},
		{
			"<leader>h2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
		},
		{
			"<leader>h3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
		},
		{
			"<leader>h4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
		},
	},
	config = function()
		require("harpoon").setup()
	end,
}
