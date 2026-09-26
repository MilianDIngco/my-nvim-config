local capabilities = require("blink.cmp").get_lsp_capabilities()

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
