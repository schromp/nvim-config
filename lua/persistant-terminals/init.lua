local M = {}

M.setup = function()
	print("Setup")
end

M.newTerm = function(name)
	vim.fn.jobstart({ "shpool", "attach", name }, { term = true })
end

M.findTerms = function()
	-- TODO: dont use awk and parse the output of shpool list directly
	require("fzf-lua").fzf_exec("shpool list | awk 'NR>1 {print $1}'", {
		actions = {
			["default"] = function(selected)
				M.newTerm(selected[1])
			end,
		},
	})
end

return M
