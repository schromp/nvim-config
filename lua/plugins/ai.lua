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


vim.keymap.set("n", "<TAB>", function ()
  if not (require("sidekick").nes_jump_or_apply()) then
    return "<Tab>"
  end
end , { desc = "Goto/Apply Next Edit Suggestion" })

vim.pack.add({"https://github.com/olimorris/codecompanion.nvim"})

require("codecompanion").setup({
  adapters = {
    http = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-flash-latest",
            },
          },
          env = {
          },
        })
      end,
    },
  },
  display = {
    chat = {
      show_settings = true,
    },
    diff = {
      provider = "snacks",
    },
  },
  strategies = {
    chat = {
      slash_commands = {
        ["file"] = {
          opts = {
            provider = "snacks",
          },
        },
        ["buffer"] = {
          opts = {
            provider = "snacks",
          },
        },
      },
    },
  }
})

vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code Companion Code Action" })
vim.keymap.set("v", "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "<leader>ai", ":CodeCompanion ", {desc = "Code Companion Code Action"})
