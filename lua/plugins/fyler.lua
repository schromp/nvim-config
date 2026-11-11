vim.pack.add({ "https://github.com/FylerOrg/fyler.nvim" })

local fyler = require("fyler")

fyler.setup({
  -- Optional configuration options
  -- You can customize the behavior of Fyler.nvim here
  follow_current_file = false,
  ui = {
    indent_guides = true,
  },
})

-- vim.keymap.set("n", "<leader>e", function()
-- 	fyler.open({ kind = "split_left_most" })
-- end, { desc = "Fyler.nvim - Open" })

vim.keymap.set("n", "<leader>E", function()
  local home = assert(vim.uv.os_homedir())

  require("fzf-lua").fzf_exec("fd --type d --hidden --no-ignore . " .. vim.fn.shellescape(home), {
    prompt = "Find Path in Home> ",
    actions = {
      ["default"] = function(selected)
        if not selected or not selected[1] then
          return
        end
        local root_path = selected[1]
        vim.schedule(function()
          fyler.open({ kind = "split_left_most", root_path = root_path })
        end)
      end,
    },
  })
end, { desc = "Fyler.nvim - Find Path in Home" })
