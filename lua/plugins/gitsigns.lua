return {
  "lewis6991/gitsigns.nvim",
  keys = {
    { "<leader>gs", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" },
    { "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Toggle showing delete lines" },
    { "<leader>gc", ":let @+ = system('git branch --show-current')<CR>", desc = "Copy the current branch name" },
  },
  lazy = false,
  config = function()
    require("gitsigns").setup()
  end,
}
