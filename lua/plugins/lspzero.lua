return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	enabled = true,
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-path" }, -- Required
		{ "hrsh7th/cmp-buffer" },
		{ "saadparwaiz1/cmp_luasnip" }, -- Required
		{ "elkowar/yuck.vim" },
		{ "vmware-archive/salt-vim" },
		{ "folke/neodev.nvim" },
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			lsp.default_keymaps({ buffer = bufnr })
			local opts = { buffer = bufnr }

			vim.keymap.set({ "n", "x" }, "gq", function()
				vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
			end, opts)
			vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts)
		end)

		-- When you don't have mason.nvim installed
		-- You'll need to list the servers installed in your system
		lsp.setup_servers({ "nixd", "pyright", "lua_ls", "phpactor", "gopls", "tsserver", "cssls", "clangd"})

		-- (Optional) Configure lua language server for neovim
		require("lspconfig").texlab.setup({
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = true,
				onSave = true,
			},
		})

		lsp.setup()

		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()

		---require('luasnip.loaders.from_vscode').lazy_load()

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "cody" },
			},
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			},
			window = {
				completeopt = "menu,menuone,noinsert",
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})

    vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "Red" })

	end,
}
