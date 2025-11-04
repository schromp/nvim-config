return {
	dir = "~/.config/nvim/lua/salt-nacl",
  enabled = false,
  lazy = true,
	keys = {
		{ "<leader>sd", mode = "v", function() require("salt-nacl").decrypt() end, desc = "Decrypt visual selection" },
		{ "<leader>se", mode = "v", function() require("salt-nacl").encrypt() end, desc = "Encrypt visual selection" },
	},
}
