return {
	"nathom/filetype.nvim",
	config = function()
		vim.g.did_load_filetypes = 1

		require("filetype").setup({
			overrides = {
				extensions = {
					-- sls = "yaml",
				},
			},
		})
	end,
}
