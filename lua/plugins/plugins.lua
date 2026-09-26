-- Format
-- {
--  "repo string",
--  name = string that overrides the plugin name. used in case of collosions or
--  dir = path pointing to  local path, instead of downloading it.t.
--  url = explicit git URL
--  branch, tag, commit, version = pin to a specific branch / tag / commit
--  pin = true if you want to exclude this plugin from updates
--
--  LOADING BEHAVIOR
--  lazy = bool. If false, it loads at startup. if true, it waits for some trigger
--  event = "VeryLazy" or
--          "BufReadPre"(before a real non-empty buffer is read) or
--          "InsertEnter" when u enter insert mode
--          "BufNewFile" when you make a new file
--          "BufReadPre *.md" pattern restrictions like only on md files
--  cmd = "Telescope" would only load the plugin when u run :Telescope
--  ft = load for specific filetypes
--  keys = load when a specific keymap is pressed. (well i just use a keymaps file instead
--  dependencies - list of other plugins to load first.
--  priority = number that determines the order of loading (higher prio loads earlier
--
--  CONFIGURATION
--  init = function() - run before the plugin is loaded (during startup even if the plugin loads later
--  config = function() - run after the plugin loads. where u usually call require('path to script').setup() and stuff.
--  opts = {} table or function returning a table that merges into the plugin's setup call automatically. preferred over a config
--    function if all ur doing is passing a set up table.
--  main = override which module opts calls .setup() on. what the heck does that mean?
-- }

-- Notes
-- neotree - i want to go through the sources options. the git option looks interesting and seems helpful

return {
	{
		"AstroNvim/astrotheme",
		lazy = false,
		priority = 1000,
		config = function()
			require("astrotheme").setup({
				palette = "astrodark",
				background = {
					light = "astrolight",
					dark = "astrodark",
				},
				style = {},
				termguicolors = true,
				terminal_colors = true,
				plugin_default = "auto",
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				theme = "auto", -- TODO
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("config.treesitter")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("config.telescope") -- TODO
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		lazy = true,
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "LazyVim", words = { "LazyVim" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("config.lsp") -- TODO
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("config.formatting") --TODO (check github)
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		-- TODO configure linters pls
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, --makes lazydev completions top prio
					},
				},
			},
			keymap = { preset = "default" },
			completion = { documentation = { auto_show = false } },
			opts_extend = { "sources.default" },
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
		config = function()
			require("config.rust") -- TODO check git repo
		end,
	},
	-- TODO ng.nvim, nx.nvim, and flutter tools. only doing later bc i prolly won't be doing much of that personally.

	-- astrotheme for the colorscheme
	-- lualine for status bar
	-- neotree for the sidebar file explorer
	-- treesitter for abstracting parsing syntax. useful.
	-- telescope for file fuzzy finding
	-- lazydev.nvim for configuring Lua language server (note: need to attach to nvim-cmp source explicitly for neovim globals)
	-- blink.cmp for lazydev.nvim for require statements and module annotations
	-- luvit-meta for providing autocompletion, hover documentation, and making editing neovim config better bc when else am i using lua...
	-- mason for portable package managing for neovim <3
	-- conform.nvim for formatting
	-- ?nvim-lint for linting... duh
	-- nvim-cmp is a completion engine plugin, so it manages suggestions from multiple backends like LSP, file paths, and buffer text
	-- rustaceanvim configures rust analyzer without needing nvim-lspconfig. a bunch of other stuff i should look into
	-- flutter-tools.nvim for building, running, and debugging flutter and dart apps.
	-- ng.nvim - angular dev functionality for neovim. also hnadles the vscode-ng-language-server capabilities
	-- nx.nvim - brings nx monorepo management features into the terminal and editor workflows.
}
