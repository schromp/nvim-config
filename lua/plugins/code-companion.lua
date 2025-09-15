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
    display = {
      chat = {
        window = {
          layout = "floating"
        },
      },
    },
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					-- MCP Tools
					make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
					show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
					add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
					show_result_in_chat = true, -- Show tool results directly in chat buffer
					format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
					-- MCP Resources
					make_vars = true, -- Convert MCP resources to #variables for prompts
					-- MCP Prompts
					make_slash_commands = true, -- Add MCP prompts as /slash commands
				},
			},
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
		{
			"ravitemer/mcphub.nvim",
			ft = { "codecompanion" },
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			build = "bundled_build.lua",
			config = function()
				require("mcphub").setup({
					use_bundled_binary = true,
				})
			end,
		},
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
