return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>fl",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Select find builtins",
		},
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
				require("fzf-lua").live_grep()
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
		{
			"<leader>fp",
			function()
				-- require("fzf-lua").files({
				-- 	cwd = "~/repos",
				-- 	actions = {
				-- 		["default"] = function(selected)
				-- 			local filepath = selected[1]
				-- 			local dir = vim.fn.fnamemodify(filepath, ":p:h")
				-- 			vim.api.nvim_set_current_dir(dir)
				-- 		end,
				-- 	},
				-- })
				require("fzf-lua").fzf_exec("ls ~/repos", {
					actions = {
						["default"] = function(selected, _opts)
							vim.api.nvim_set_current_dir("~/repos/" .. selected[1])
						end,
					},
				})
			end,
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
