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
		formatters = {
			-- saltlint = {
			-- 	command = "salt-lint",
			-- 	args = { "--nocolor", "--json", "$FILENAME" },
			-- 	stdin = false,
			-- 	-- Adds environment args to the yamlfix formatter
			-- 	-- env = {
			-- 	-- 	YAMLFIX_SEQUENCE_STYLE = "block_style",
			-- 	-- },
			-- },
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			nix = { "alejandra" },
			yaml = { { "prettierd", "prettier" } },
			html = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			php = { "php_cs_fixer" },
			rust = { "rustfmt" },
			md = { "mdformat" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			tf = { "terraform_fmt" },
		},
	},
}
