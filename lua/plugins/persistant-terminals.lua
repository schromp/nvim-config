return {
	dir = vim.fn.stdpath("config") .. "/lua/persistant-terminals",
	dev = true,
	keys = {
		{
			"<leader>ft",
			function()
				require("persistant-terminals").findTerms()
			end,
			desc = "Find Persistent Terminals",
		},
		{
			"<leader>tc",
			function()
				vim.ui.input({ prompt = "Terminal name: " }, function(input)
					if input and input ~= "" then
						require("persistant-terminals").newTerm(input)
					end
				end)
			end,
			desc = "Create Persistent Terminal",
		},
	},
	config = function()
		require("persistant-terminals").setup()
	end,
}
