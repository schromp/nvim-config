vim.pack.add({"https://github.com/zbirenbaum/copilot.lua"})

require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = false,
    debounce = 15,
    trigger_on_accept = true,
    keymap = {
      accept = "<C-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
      toggle_auto_trigger = false,
    },
  },
})

vim.pack.add({"https://github.com/folke/sidekick.nvim"})

require("sidekick").setup({

})


vim.keymap.set("n", "<leader>aa", require("sidekick.cli").toggle, { desc = "Toggle Sidekick CLI" })
vim.keymap.set("n", "<TAB>", function ()
  if not (require("sidekick").nes_jump_or_apply()) then
    return "<Tab>"
  end
end , { desc = "Goto/Apply Next Edit Suggestion" })
