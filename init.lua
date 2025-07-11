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

JsonVariables = require "lib.dynconfig"

require "core.options"
require "core.keymaps"
require "core.neovide"
require "core.lsp"


require("lazy").setup("plugins")

vim.cmd('colorscheme ' .. DynConfig.theme)
