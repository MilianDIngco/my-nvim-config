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

-- Telescope

local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		select_strategy = "reset",
		mappings = {},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

local function smart_file_open(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local original_win = current_picker and current_picker.original_win_id

	local entry = action_state.get_selected_entry()

	actions.close(prompt_bufnr)

	if original_win and vim.api.nvim_win_is_valid(original_win) then
		local original_buf = vim.api.nvim_win_get_buf(original_win)
		local original_ft = vim.api.nvim_get_option_value("filetype", { buf = original_buf })

		if original_ft == "NvimTree" or original_ft == "neo-tree" then
			vim.cmd("wincmd l")
		end
	end

	if entry then
		local target_file = entry.filename or entry.value

		if target_file then
			vim.cmd("edit " .. vim.fn.fnameescape(target_file))

			if entry.lnum then
				vim.api.nvim_win_set_cursor(0, { entry.lnum, entry.col or 0 })
			end
		end
	end
end

local function attach_smart_open(_, map)
	map("i", "<CR>", smart_file_open)
	return true
end
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({ attach_mappings = attach_smart_open })
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>pf", function()
	builtin.live_grep({ attach_mappings = attach_smart_open })
end, { desc = "Project find (Live grep)" })

vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers({ attach_mappings = attach_smart_open })
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>fr", function()
	builtin.oldfiles({ attach_mappings = attach_smart_open })
end, { desc = "Recent files" })
