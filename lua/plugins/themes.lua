return {
  {
    "navarasu/onedark.nvim",
    config = function()
      -- vim.cmd([[colorscheme onedark]])
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
    lazy = false,
    name = "catppuccin",
    config = function()
      require('catppuccin').setup({
        flavour = "frappe",
        transparent_background = true, -- disables setting the background color.
      })
      vim.cmd([[colorscheme catppuccin]])
    end
  },
  {
    "sainnhe/gruvbox-material"
  },
  {
    "AlexvZyl/nordic.nvim"
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        transparent = false,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- NormalFloat = { bg = "none" },
            -- FloatBorder = { bg = "none" },
            -- FloatTitle = { bg = "none" },
            --
            -- -- Save an hlgroup with dark background and dimmed foreground
            -- -- so that you can use it where your still want darker windows.
            -- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            --
            -- -- Popular plugins that open floats will link to NormalFloat by default;
            -- -- set their background accordingly if you wish to keep them dark and borderless
            -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            --
            -- TelescopeTitle = { fg = theme.ui.special, bold = true },
            -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
      })
    end,
  },
}
