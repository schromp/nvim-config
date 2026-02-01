vim.pack.add({"https://github.com/saghen/blink.cmp"})

require("blink.cmp").setup({
  fuzzy = { implementation = "lua" },
  keymap = {
    ["<Tab>"] = {
      "snippet_forward",
      function() -- sidekick next edit suggestion
        return require("sidekick").nes_jump_or_apply()
      end,
      function() -- if you are using Neovim's native inline completions
        return vim.lsp.inline_completion.get()
      end,
      "fallback",
    },
  },
})
