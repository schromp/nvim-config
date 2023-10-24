return {
  "TimUntersberger/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Toggle Neogit" }
  },
  enabled = true,
  config = function()
    local neogit = require("neogit")

    neogit.setup {
      integrations = {
        diffview = true
      }
    }
  end,
}
