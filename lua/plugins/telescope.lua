return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("projects")
    end,
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
    { "<leader>fa", "<cmd>Telescope live_grep<cr>",                 desc = "Find Files" },
    { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find Files" },
    { "<leader>fu", "<cmd>Telescope grep_string<cr>",               desc = "Find Files" },
    { "<leader>fk", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
    { "<leader>fp", "<cmd>Telescope neovim-project history<cr>",    desc = "Command History" },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        -- file_browser = {},
      },
    })
    -- require("telescope").load_extension("file_browser")
  end,
}
