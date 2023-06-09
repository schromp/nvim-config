return {
  {
    "navarasu/onedark.nvim",
    config = function ()
      vim.cmd([[colorscheme onedark]])
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    config = function()
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        transparent = false,
        theme = "wave",
      })
      -- vim.cmd([[colorscheme kanagawa]])
    end,
  },
}
