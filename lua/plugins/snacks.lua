return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		picker = {
			enabled = true,
		},
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		-- terminal = {
		-- 	win = {
		-- 		keys = {
		-- 			nav_h = { "<C-h>", term_nav("h"), desc = "Go to Left Window", expr = true, mode = "t" },
		-- 			nav_j = { "<C-j>", term_nav("j"), desc = "Go to Lower Window", expr = true, mode = "t" },
		-- 			nav_k = { "<C-k>", term_nav("k"), desc = "Go to Upper Window", expr = true, mode = "t" },
		-- 			nav_l = { "<C-l>", term_nav("l"), desc = "Go to Right Window", expr = true, mode = "t" },
		-- 		},
		-- 	},
		-- },
		dashboard = {
			width = 60,
			row = nil, -- dashboard position. nil for center
			col = nil, -- dashboard position. nil for center
			pane_gap = 4, -- empty columns between vertical panes
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
			-- These settings are used by some built-in sections
			preset = {
				-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
				---@type fun(cmd:string, opts:table)|nil
				pick = nil,
				-- Used by the `keys` section to show keymaps.
				-- Set your custom keymaps here.
				-- When using a function, the `items` argument are the default keymaps.
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				-- Used by the `header` section
				header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
			},
			-- item field formatters
			formats = {
				icon = function(item)
					if item.file and item.icon == "file" or item.icon == "directory" then
						return M.icon(item.file, item.icon)
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":~")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
	keys = {
		{
			"<leader>n",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>pc",
			function()
				Snacks.dashboard()
			end,
			desc = "Open the dashboard",
		},
		{
			"<leader>fe",
			function()
				Snacks.explorer()
			end,
			desc = "Open the explorer",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker("files")
			end,
			desc = "Find files",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker("buffers")
			end,
			desc = "Find buffers",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker("diagnostics")
			end,
			desc = "Find diagnostics",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep({
					dirs = { vim.api.nvim_buf_get_name(0) },
				})
			end,
			desc = "Grep in current buffer",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker("grep")
			end,
			desc = "Grep in project",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker("grep_word")
			end,
			desc = "Grep word under cursor",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker("colorschemes")
			end,
			desc = "Find colorschemes",
		},
	},
}
