return {
	"danymat/neogen",
	keys = {
		{ "<leader>lg", function() require('neogen').generate() end, desc = "Generate annotations" },
	},
	config = true,
	-- Uncomment next line if you want to follow only stable versions
	-- version = "*"
}
