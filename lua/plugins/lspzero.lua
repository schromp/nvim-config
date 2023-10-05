return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },         -- Required
    { 'hrsh7th/cmp-nvim-lsp' },     -- Required
    { 'hrsh7th/cmp-path' },         -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'saadparwaiz1/cmp_luasnip' }, -- Required
    { 'elkowar/yuck.vim' },
    { 'vmware-archive/salt-vim' },
  },
  config = function()
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({ buffer = bufnr })
      local opts = { buffer = bufnr }

      vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end, opts)
    end)

    -- When you don't have mason.nvim installed
    -- You'll need to list the servers installed in your system
    lsp.setup_servers({ 'nixd', 'jedi_language_server', 'lua_ls', 'phpactor', 'gopls'})

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    ---require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
      mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      },
      window = {
        completeopt = 'menu,menuone,noinsert',
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    })
  end
}
