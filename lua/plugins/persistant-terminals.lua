return {
	dir = vim.fn.stdpath("config") .. "/lua/persistant-terminals",
	dev = true,
	config = function()
		require("persistant-terminals").setup()
	end,
}
