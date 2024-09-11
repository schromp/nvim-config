return {
  "RRethy/vim-illuminate",
  opts = { delay = 200, under_cursor = false },
  enabled = false,
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}
