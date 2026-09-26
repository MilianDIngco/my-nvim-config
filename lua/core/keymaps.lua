-- Set remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Manual format keymap
vim.keymap.set("n", "<leader>fm", function()
	require("conform").format({ bufnr = 0 })
end, {})
-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

-- NEOTREE
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.keymap.set("n", "<leader>en", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

-- Telescope
-- lua/core/keymaps.lua (telescope section becomes this)
local telescope_cfg = require("config.telescope")

vim.keymap.set("n", "<leader>ff", telescope_cfg.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>pf", telescope_cfg.live_grep, { desc = "Project find (Live grep)" })
vim.keymap.set("n", "<leader>fb", telescope_cfg.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fr", telescope_cfg.oldfiles, { desc = "Recent files" })
