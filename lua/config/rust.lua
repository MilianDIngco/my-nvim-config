local capabilities = {}
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
	capabilities = cmp_lsp.default_capabilities()
end

vim.g.rustaceanvim = {
	server = {
		capabilities = capabilities,
		default_settings = {
			["rust-analyzer"] = {
				check = { command = "clippy", extraArgs = { "--", "-W", "clippy::pedantic" } },
				cargo = { allFeatures = true },
				procMacro = { enable = true },
			},
		},
	},
}
