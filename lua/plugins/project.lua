-- return {
-- 	"ahmedkhalf/project.nvim",
-- 	enabled = false,
-- 	event = "VeryLazy",
-- 	opts = {},
-- 	config = function (_, opts)
-- 		require("project_nvim").setup(opts)
-- 	end
-- }
return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/Repos/indi/*",
      "~/Repos/cruises/*",
      "~/Repos/non-essential/*",
      "~/.config/*",
    },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
}
