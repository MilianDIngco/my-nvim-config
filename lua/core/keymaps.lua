-- Set remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Manual format keymap
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})

-- NEOTREE
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>")

-- Telescope
-- local status_ok, builtin = pcall(require, "telescope.builtin")
-- if not status_ok then
--   print("Warning: Telescope not found while loading keymaps")
-- end
--
-- if status_ok then
--   vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
--   vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
--   vim.keymap.set("n", "<leader>pf", builtin.live_grep, {})
-- end
