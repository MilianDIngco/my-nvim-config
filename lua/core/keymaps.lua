-- Set map leaders
vim.g.mapleader = " "

-- Set remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- show errors
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
