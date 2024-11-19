vim.cmd([[ set nofoldenable]])

local o = vim.o
local g = vim.g

o.autochdir = true
o.cmdheight = 0
o.number = true
o.relativenumber = true
o.lazyredraw = false
o.wrap = true
o.foldenable = false
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.confirm = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.expandtab = true
o.laststatus = 3
o.termguicolors = true
o.cursorline = true
o.undofile = true
o.backup = false
o.swapfile = false
o.scrolloff = 999
o.splitbelow = true
o.splitright = true
o.signcolumn = "yes"
o.hlsearch = false
o.guifont = "JetBrainsMono Nerd Font:h24"

g.mapleader = " "
g.maplocalleader = " "
