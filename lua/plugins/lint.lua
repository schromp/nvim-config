return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      sls = { 'salt' }
    }

    lint.linters.salt = {
      cmd = 'salt-lint',
      stdin = true,            -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
      append_fname = true,     -- Automatically append the file name to `args` if `stdin = false` (default: true)
      args = { "--json" },     -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
      stream = 'stderr',       -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
      ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
      env = nil,               -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
      parser = function(output, bufnr)
        local diagnostics
        local ok, decoded = pcall(vim.json.decode, output)

        if not ok then
          return diagnostics
        end
        for _, item in ipairs(decoded.Results) do
          table.insert(diagnostics, {
            lnum = item.linenumber,
            source = "salt-lint",
            code = item.id,
            message = item.message
          })
        end
      end
    }

    -- lnum
    -- code
    -- text
    -- type

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
