return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<C-]>", "<cmd>ToggleTerm<cr>", desc = "Open a terminal" },
	},
	config = function()
		require("toggleterm").setup({
			direction = "float",
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-]>", [[<Cmd>ToggleTerm<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
