return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", "go.work", ".git" },
  on_attach = function(client, bufnr)
    -- Check if the LSP server supports formatting
    if client:supports_method("textDocument/formatting") then
      -- Create an autocmd to format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
        end,
      })
    end
  end,
}
