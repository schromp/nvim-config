return {
  "jose-elias-alvarez/null-ls.nvim",
  enabled = true,
  dependendcies = { "VonHeikemen/lsp-zero.nvim" },
  -- event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local nls = require("null-ls")
    local root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    local sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.alejandra,
      nls.builtins.formatting.gofmt,
      -- nls.builtins.formatting.yq,
      nls.builtins.formatting.prettierd,
      nls.builtins.diagnostics.saltlint,
      nls.builtins.diagnostics.yamllint,
    }
    nls.setup({sources = sources})
  end,
}
