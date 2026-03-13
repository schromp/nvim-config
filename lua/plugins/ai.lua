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
vim.keymap.set("i", "<C-l>", function () require("copilot.suggestion").accept() end, { desc = "Accept suggestion" })

vim.pack.add({"https://github.com/folke/sidekick.nvim"})

require("sidekick").setup({
  cli = {
    tools = {
      cursor = {
        cmd = {"cursor-agent"}
      }
    }
  }
})


vim.keymap.set("n", "<TAB>", function ()
  if not (require("sidekick").nes_jump_or_apply()) then
    return "<Tab>"
  end
end , { desc = "Goto/Apply Next Edit Suggestion" })

-- vim.keymap.set("n", "<leader>ac", function () require('sidekick.cli').toggle() end, { desc = "Code Companion Code Action" })

vim.pack.add({"https://github.com/olimorris/codecompanion.nvim"})

require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = "opencode",
    },
  },
  display = {
    chat = {
      show_settings = false,
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
