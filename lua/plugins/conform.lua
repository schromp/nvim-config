vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		["*"] = { "trim_whitespace" },
		lua = { "stylua" },
		nix = { "nixfmt" },
	},
})

vim.keymap.set("n", "gq", function()
	require("conform").format()
end, { desc = "Format file" })
