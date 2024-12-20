return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add buffer to harpoon list",
		},
		{
			"<leader>hh",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Open harpoon menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Open harpoon menu",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Open harpoon menu",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Open harpoon menu",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Open harpoon menu",
		},
	},
}
