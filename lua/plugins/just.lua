return {
    "al1-ce/just.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'rcarriga/nvim-notify',
        'j-hui/fidget.nvim',
    },
	keys = {
		{ "<leader>jj", "<cmd>JustSelect<cr>", desc = "Select just command to run" },
    },
    config = true
}
