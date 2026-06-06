return {
	-- color schemes --
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			require("config.colorscheme")
		end,
	},

	-- TREESITTER
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("config.treesitter")
		end,
	},

	-- TELESCOPE
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("config.telescope")
		end,
	},

	-- NEOTREE
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		opts = {},
		config = function()
			require("config.neotree")
		end,
	},

	-- LUALINE
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lualine")
		end,
	},

	-- MASON
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("config.lsp")
		end,
	},

	-- NONE LS
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("config.formatting")
		end,
	},

	-- COMPLETIONS
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			require("config.completion")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{ "hrsh7th/nvim-cmp" },

	-- RUST
	{ "simrat39/rust-tools.nvim" },
  -- Flutter / Dart
--	{
--		"nvim-flutter/flutter-tools.nvim",
--		lazy = false,
--		dependencies = {
--			"nvim-lua/plenary.nvim",
--			"stevearc/dressing.nvim", -- optional for vim.ui.select
--		},
--		config = true,
--	},
}
