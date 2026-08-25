-- MASON SETUP
require("mason").setup()

-- Fetch capabilities from nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup mason-lspconfig to manage server installations
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "pyright", "ts_ls", "html", "cssls", "angularls", "eslint" },
})

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client and client.name == "eslint" then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})
		end
	end,
})

vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--compile-commands-dir=.build" },
})

vim.lsp.config("eslint", {
	root_dir = function(filename)
		return vim.fs.root(filename, { "nx.json", "package.json", ".git" })
	end,
	settings = {
		nodePath = "/home/mingco/.nvm/version/node/v24.19.0/lib/node_modules",
		workingDirectories = { mode = "auto" },
	},
})

vim.lsp.config("angularls", {
	root_dir = function(filename)
		return vim.fs.root(filename, { "nx.json", "angular.json", "package.json" })
	end,
	cmd = (function()
		local project_root = vim.fs.root(0, { "nx.json", "angular.json", "package.json" }) or vim.fn.getcwd()
		local ts_probe = project_root .. "/node_modules/typescript/lib"
		return { "ngserver", "--stdio", "--tsProbeLocations", ts_probe, "--ngProbeLocations", ts_probe }
	end)(),
	filetypes = { "typescript", "html", "htmlangular", "typescriptreact", "typescript.tsx" },
	env = {
		NODE_PATH = "/home/mingco/.nvm/versions/node/v24.19.0/lib/node_modules",
	},
})

local servers = { "lua_ls", "clangd", "pyright", "ts_ls", "html", "cssls", "angularls", "eslint" }
for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})
