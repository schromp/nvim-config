vim.pack.add({ "https://github.com/saghen/blink.lib", "https://github.com/saghen/blink.cmp" })

require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	completion = {
		documentation = { auto_show = true },
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind" },
				},
			},
		},
	},
	sources = {
		per_filetype = {
			codecompanion = { "codecompanion" },
		},
	},
	keymap = {
		["<Tab>"] = {
			"snippet_forward",
			function() -- sidekick next edit suggestion
				return require("sidekick").nes_jump_or_apply()
			end,
			function() -- if you are using Neovim's native inline completions
				return vim.lsp.inline_completion.get()
			end,
			"fallback",
		},
	},
})
