return {
	"mfussenegger/nvim-lint",
	ft = { "salt" },
	config = function()
		require("lint").linters_by_ft = {
			salt = { "saltlint" },
		}
		vim.api.nvim_create_autocmd({ "insertleave", "bufwritepost" }, {
			callback = function()
				-- try_lint without arguments runs the linters defined in `linters_by_ft`
				-- for the current filetype
				require("lint").try_lint()

				-- you can call `try_lint` with a linter name or a list of names to always
				-- run specific linters, independent of the `linters_by_ft` configuration
				-- require("lint").try_lint("cspell")
			end,
		})
	end,
}
