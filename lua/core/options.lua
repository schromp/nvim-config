opt = vim.opt

--colorscheme
--vim.cmd[[colorscheme tokyonight]]
vim.cmd("set nofixendofline")

-- line numbers
opt.relativenumber = true
opt.number = true --shows line number of current line

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
-- opt.smartindent = true -- # WARN: this messes up nix {} placement

-- line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

--cursor line
opt.cursorline = true

-- termcolors (need to be disabled for themes)
opt.termguicolors = false
--opt.background = "dark"
-- opt.signcolumn = "yes" -- show sign column so that text doesnt shift (?)

opt.scrolloff = 0

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitbelow = true

-- for which key
-- opt.timeoutlen = 300

-- cursor
--opt.guicursor = ""

-- vim.opt.listchars = {eol = '↵', tab = '-'}
-- vim.opt.list = true

vim.opt.termguicolors = true
