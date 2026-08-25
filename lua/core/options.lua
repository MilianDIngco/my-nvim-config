-- fix colors tmuxx
vim.opt.termguicolors = true
vim.opt.background = "light"

-- Set vim opts
vim.cmd("filetype indent off")
vim.opt.relativenumber = true
vim.g.rust_recommended_style = 0
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.opt.clipboard = "unnamedplus"
vim.o.modeline = false
