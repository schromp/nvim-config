return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>fr",
			function()
				require("fzf-lua").resume()
			end,
			desc = "Resume last query",
		},
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fa",
			function()
				require("fzf-lua").grep()
			end,
			desc = "Grep all files",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").grep_curbuf()
			end,
			desc = "Grep current file",
		},
		{
			"<leader>fu",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "Grep word under cursor",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find buffers",
		},
	},
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
}
