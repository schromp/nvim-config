local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")
require("core.neovide")
require("core.lsp")

require("lazy").setup("plugins")

vim.cmd("colorscheme rose-pine")

-- local function source_matugen()
-- 	-- Update this with the location of your output file
-- 	local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua" -- dofile doesn't expand $HOME or ~
--
-- 	local file, err = io.open(matugen_path, "r")
-- 	-- If the matugen file does not exist (yet or at all), we must initialize a color scheme ourselves
-- 	if err ~= nil then
-- 		-- Some placeholder theme, this will be overwritten once matugen kicks in
-- 		vim.cmd("colorscheme base16-catppuccin-mocha")
--
-- 		-- Optionally print something to the user
-- 		vim.print(
-- 			"A matugen style file was not found, but that's okay! The colorscheme will dynamically change if matugen runs!"
-- 		)
-- 	else
-- 		dofile(matugen_path)
-- 		io.close(file)
-- 	end
-- end
--
--
-- local transparent_groups = {
--   'Normal', 'NormalNC', 'EndOfBuffer', 'NonText',
--   'LineNr', 'CursorLine', 'CursorLineNr', 'SignColumn',
--   'Folded', 'NormalFloat', 'FloatBorder', 'VertSplit',
--   -- Add other groups as needed, e.g., NvimTree, Telescope
--   'NvimTreeNormal', -- If you use NvimTree or a similar file explorer
--   'TelescopeNormal', -- For the Telescope fuzzy finder
--   'NeoTreeGitModified',
--
-- }
--
-- -- Function to set the background of a highlight group to NONE
-- local function set_transparent_background()
--   for _, group in ipairs(transparent_groups) do
--     vim.api.nvim_set_hl(0, group, { bg = 'NONE', ctermbg = 'NONE' })
--   end
-- end
--
-- -- Main entrypoint on matugen reloads
-- local function auxiliary_function()
-- 	-- Load the matugen style file to get all the new colors
-- 	local matugen_path = os.getenv("HOME") .. "/.config/nvim/generated.lua"
-- 	source_matugen()
--
-- 	-- Because reloading base16 overwrites lualine configuration, just source lualine here
-- 	dofile(os.getenv("HOME") .. "/.config/nvim/lua/plugins/lualine.lua") -- path of your lualine setup
--
-- 	-- Any other options you wish to set upon matugen reloads can also go here!
-- 	vim.api.nvim_set_hl(0, "Comment", { italic = true })
--
--   -- set_transparent_background()
-- end
--
-- -- Register an autocmd to listen for matugen updates
-- vim.api.nvim_create_autocmd("Signal", {
-- 	pattern = "SIGUSR1",
-- 	callback = auxiliary_function,
-- })
--
-- -- Additionally call this function once on startup to query for matugen's theme
-- -- or set a default
-- auxiliary_function()
