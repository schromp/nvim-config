return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  enabled = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        -- filtered_items = {
        --   visible = true,
        --   hide_dotfiles = true,
        --   hide_gitignored = true,
        --   hide_hidden = false,
        -- },
      },
    })
  end,
}
