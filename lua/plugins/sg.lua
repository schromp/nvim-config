return {
	{
		"sourcegraph/sg.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
		},
		keys = {
			{ "<leader>cc", "<cmd>CodyToggle<cr>", desc = "Toggle Cody Chat window" },
		},
    lazy = false,
    enabled = true,
		config = function()
			require("sg").setup({
				enable_cody = true,
				accept_tos = true,
			})

			vim.keymap.set("n", "<space>ca", function()
				local q = vim.fn.input("Ask: ")
				require("sg.cody.commands").ask({q})
			end)

			vim.keymap.set("v", "<space>ca", function()
				local q = vim.fn.input("Ask: ")
				local start_pos, end_pos = vim.fn.getpos("v"), vim.fn.getpos(".")
				require("sg.cody.commands").ask_range(start_pos[1], start_pos[2], end_pos[2], q)
			end)

			vim.keymap.set("v", "<space>ct", function()
				local q = vim.fn.input("Task: ")
				local start_pos, end_pos = vim.fn.getpos("v"), vim.fn.getpos(".")
				require("sg.cody.commands").do_task(start_pos[1], start_pos[2], end_pos[2], q)
			end)
		end,
	},
}
