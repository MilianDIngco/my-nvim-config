-- Auto install formatters
local mason_registry = require("mason-registry")

-- Cleaned up tools list: "eslint" is handled by mason-lspconfig
local tools = { "stylua", "clang-format", "prettier" }

for _, tool in ipairs(tools) do
	local package = mason_registry.get_package(tool)
	if not package:is_installed() then
		package:install()
	end
end

-- ==============================================================================
-- 1. NONE-LS Setup (Formatters ONLY)
-- ==============================================================================
local null_ls = require("null-ls")
null_ls.setup({
	debug = false,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"typescript",
				"html",
				"css",
				"scss",
				"json",
				"yaml",
				"markdown",
				"htmlangular",
			},
		}),
	},
})

-- ==============================================================================
-- 2. Format on Save (Robust Selection)
-- ==============================================================================
local format_augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = format_augroup,
	callback = function()
		vim.lsp.buf.format({
			async = false,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})
