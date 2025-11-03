-- Auto install formatters
local mason_registry = require("mason-registry")
local formatters = { "stylua", "clang-format", "prettier" }

for _, formatter in ipairs(formatters) do
	local package = mason_registry.get_package(formatter)
	if not package:is_installed() then
		package:install()
	end
end

-- NONE-LS
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.prettier,
	},
})

vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
