return {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	opts = {},
	config = function (_, opts)
		require("project_nvim").setup(opts)
	end
}
