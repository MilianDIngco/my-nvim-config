local M = {}
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		select_strategy = "reset",
		mappings = {},
	},
	-- extensions = {
	-- 	["ui-select"] = {
	-- 		require("telescope.themes").get_dropdown({}),
	-- 	},
	-- },
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

function M.find_files()
	builtin.find_files({ attach_mappings = attach_smart_open })
end

function M.live_grep()
	builtin.live_grep({ attach_mappings = attach_smart_open })
end

function M.buffers()
	builtin.buffers({ attach_mappings = attach_smart_open })
end

function M.oldfiles()
	builtin.oldfiles({ attach_mappings = attach_smart_open })
end

return M
