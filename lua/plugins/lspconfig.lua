return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neodev.nvim" },
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-path" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" }, -- Required
			{ "vmware-archive/salt-vim" },
			{ "onsails/lspkind.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.gopls.setup({})
			lspconfig.nixd.setup({
				cmd = { "nixd", "--inlay-hints=true" },
				settings = {
					nixd = {
						formatting = {
							command = { "nixpkgs-fmt" },
						},
						options = {
							nixos = {
								expr = '(builtins.getFlake "/home/lk/repos/nixconfig").nixosConfigurations.tower.options',
							},
							home_manager = {
								expr = '(builtins.getFlake "/home/lk/repos/nixconfig").homeConfigurations."lk".options',
							},
						},
					},
				},
			})
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({})
			lspconfig.phpactor.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.clangd.setup({
				cmd = {
					"clangd", "--query-driver=**"
				}
			})
			lspconfig.emmet_ls.setup({})
			-- lspconfig.rust_analyzer.setup({})
			lspconfig.arduino_language_server.setup({})
			lspconfig.bashls.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.texlab.setup({
				build = {
					args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
					executable = "latexmk",
					forwardSearchAfter = true,
					onSave = true,
				},
			})

			vim.keymap.set("n", "<space>le", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			vim.keymap.set("n", "<space>li", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),

				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					-- vim.keymap.set('n', '<space>wl', function()
					--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					-- end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>lr", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>la", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				end,
			})

			local cmp = require("cmp")

			require("luasnip.loaders.from_vscode").lazy_load()
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
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
					["<Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<Down>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				},
				window = {
					completeopt = "menu,menuone,noinsert",
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default
					}),
				},
			})

			vim.api.nvim_set_hl(0, "CmpItemKindCody", { fg = "Red" })
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		enabled = true,
		lazy = false, -- This plugin is already lazy
		keys = {
			{ "<leader>ld", "<cmd>RustLsp renderDiagnostic<cr>", desc = "Render rust diagnostics" },
		},
		config = function()
			vim.g.rustaceanvim = function()
				-- Update this path
				local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
				local codelldb_path = extension_path .. "adapter/codelldb"
				local liblldb_path = extension_path .. "lldb/lib/liblldb"
				local this_os = vim.uv.os_uname().sysname

				-- The path is different on Windows
				if this_os:find("Windows") then
					codelldb_path = extension_path .. "adapter\\codelldb.exe"
					liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
				else
					-- The liblldb extension is .so for Linux and .dylib for MacOS
					liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
				end

				local cfg = require("rustaceanvim.config")
				return {
					dap = {
						adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
					},
				}
			end
		end,
	},
	-- {
	-- 	"folke/neodev.nvim",
	-- 	config = function()
	-- 		require("neodev").setup({
	-- 			library = { plugins = { "nvim-dap-ui" }, types = true },
	-- 		})
	-- 	end,
	-- },
}
