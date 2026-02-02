vim.pack.add({"https://github.com/zbirenbaum/copilot.lua"})

require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      -- accept_word = "<M-l>",
      -- accept_line = "<M-S-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
})

-- Idk the in plugin mapping doesnt work so we do it here
vim.keymap.set("i", "<C-l>", function () require("copilot.suggestion").accept() end, { desc = "Toggle Sidekick CLI" })

vim.pack.add({"https://github.com/folke/sidekick.nvim"})

require("sidekick").setup({

})


vim.keymap.set("n", "<leader>aa", require("sidekick.cli").toggle, { desc = "Toggle Sidekick CLI" })
vim.keymap.set("n", "<TAB>", function ()
  if not (require("sidekick").nes_jump_or_apply()) then
    return "<Tab>"
  end
end , { desc = "Goto/Apply Next Edit Suggestion" })
