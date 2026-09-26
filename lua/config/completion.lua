-- lua/config/completion.lua
return {
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	keymap = { preset = "default" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		menu = { border = "rounded" },
	},
	signature = { enabled = true }, -- shows function signature help while typing args
	cmdline = { enabled = true }, -- blink completion in the : command line too
}
