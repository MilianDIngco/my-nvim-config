local conform = require("conform")

-- TODO add languages for formatting
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({ bufnr = args.buf })
	end,
})
