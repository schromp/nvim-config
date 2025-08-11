local M = {}

local function get_visual_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.api.nvim_buf_get_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], {})
	return table.concat(lines, ""), start_pos, end_pos
end

local function replace_visual(start_pos, end_pos, new_text)
	vim.schedule(function()
		vim.api.nvim_buf_set_text(
			0,
			start_pos[2] - 1,
			start_pos[3] - 1,
			end_pos[2] - 1,
			end_pos[3],
			vim.split(new_text, "\n", { plain = true })
		)
	end)
end

function M.decrypt()
	local input_data, start_pos, end_pos = get_visual_selection()
	print(input_data, start_pos, end_pos)

	vim.system(
		{ "python3", "/Users/lennart.koziollek/Repos/indi-salt-config/nacl_dec.py" },
		{ stdin = input_data },
		function(obj)
			if obj.code == 0 then
				vim.notify("Success:\n" .. obj.stdout, vim.log.levels.INFO)
				replace_visual(start_pos, end_pos, obj.stdout:gsub("\n$", ""))
			else
				vim.notify("Error:\n" .. obj.stderr, vim.log.levels.ERROR)
				return
			end
		end
	)
end

function M.encrypt()
	local input_data, start_pos, end_pos = get_visual_selection()

	vim.system(
		{ "python3", "/Users/lennart.koziollek/Repos/indi-salt-config/nacl_enc.py" },
		{ stdin = input_data },
		function(obj)
			if obj.code == 0 then
				vim.notify("Success:\n" .. obj.stdout, vim.log.levels.INFO)
				replace_visual(start_pos, end_pos, obj.stdout:gsub("\n$", ""))
			else
				vim.notify("Error:\n" .. obj.stderr, vim.log.levels.ERROR)
				return
			end
		end
	)
end

return M
