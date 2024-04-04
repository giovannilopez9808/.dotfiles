vim.opt.mouse = "a"

vim.opt.clipboard = { "unnamed", "unnamedplus" }

vim.opt.termguicolors = true

vim.opt.timeout = false

vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

-- EDITOR --
vim.opt.cursorcolumn = false
vim.opt.cursorline = false
vim.opt.scrolloff = 8

vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase =true
vim.opt.smartcase = true

vim.cmd("set undodir=~/.config/nvim/undotree")
vim.cmd("highlight Comment cterm=bold")
vim.cmd("set tabstop=4 softtabstop=4")
vim.cmd("set encoding=UTF-8")
vim.cmd("set colorcolumn=80")
vim.cmd("set regexpengine=1")
vim.cmd("set wrap linebreak")
vim.cmd("set termguicolors")
vim.cmd("set shiftwidth=4")
vim.cmd("set laststatus=2")
vim.cmd("set noerrorbells")
vim.cmd("set scrolloff=20")
vim.cmd("set smartindent")
vim.cmd("set ignorecase")
vim.cmd("set noswapfile")
vim.cmd("set incsearch")
vim.cmd("set expandtab")
vim.cmd("set smartcase")
vim.cmd("set hlsearch") 
vim.cmd("set undofile")
vim.cmd("set nobackup")
vim.cmd("syntax on")
vim.cmd("set wrap")
vim.cmd("set nu")
require("configs")
