return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			cmd = {
					--- This function gets invoked with the options being passed in from
					--- list:select(index, <...options...>)
					--- @param list_item {value: any, context: any}
					--- @param list { ... }
					--- @param option any
					select = function(list_item, list, option)
							-- local command = string.format("!tmux display-panes -d 2000 'send-keys -t %% \"%s\" Enter'", list_item.value)
							local pane = vim.cmd("!tmux display-panes -d 2000 'display-message -p \"%%\"'")
							print("!tmux send-keys -t " .. pane .. " \"" .. list_item.value .. " Return\"")
							vim.cmd("!tmux send-keys -t " .. pane .. " \"" .. list_item.value .. " Return\"")
					end

			}
		})

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<leader>hr", function()
			harpoon.ui:toggle_quick_menu(harpoon:list("cmd"))
		end)

		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end)
	end,
}
