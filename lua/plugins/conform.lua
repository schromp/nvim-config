return {
	"stevearc/conform.nvim",
	keys = {
		{
			"gq",
			function()
				require("conform").format({})
			end,
			desc = "Format the file",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			nix = { "alejandra" },
			sls = { "saltlint" },
			yaml = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			php = { "php_cs_fixer" },
		},
	},
}
