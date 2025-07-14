return {
	"olimorris/codecompanion.nvim",
	keys = {
		{
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Open Code Companion",
		},
		{
			"<leader>ca",
			":CodeCompanion ",
			desc = "Inline Code Companion",
			mode = { "v" },
		},
	},
	opts = {
		strategies = {
			chat = {
				adapter = "copilot",
			},
		},
		extensions = {
			-- mcphub = {
			-- 	callback = "mcphub.extensions.codecompanion",
			-- 	opts = {
			-- 		make_vars = true,
			-- 		make_slash_commands = true,
			-- 		show_result_in_chat = true,
			-- 	},
			-- },
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
			config = function()
				require("copilot").setup({
					suggestion = {
						enabled = true,
						auto_trigger = true,
						hide_during_completion = false,
						keymap = {
							accept = "<C-l>",
							prev = false,
							next = false,
							dismiss = false,
						},
					},
					filetypes = {
            yaml = true,
					},
				})
			end,
		},
		"nvim-treesitter/nvim-treesitter",
		-- "ravitemer/mcphub.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
		{
			"echasnovski/mini.diff",
			config = function()
				local diff = require("mini.diff")
				diff.setup({
					-- Disabled by default
					source = diff.gen_source.none(),
				})
			end,
		},
		{
			"HakonHarnes/img-clip.nvim",
			opts = {
				filetypes = {
					codecompanion = {
						prompt_for_file_name = false,
						template = "[Image]($FILE_PATH)",
						use_absolute_path = true,
					},
				},
			},
		},
	},
}
