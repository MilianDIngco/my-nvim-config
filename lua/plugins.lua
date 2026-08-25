return {
	-- color schemes --
	{
		"AstroNvim/astrotheme",
		name = "astrotheme",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			require("astrotheme").setup({
				palette = "astrodark",
				background = { ui = "dark", terminal = "dark" },
				termcolors = true,
			})
			vim.cmd.colorscheme("astrodark")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.lualine")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		config = function()
			require("config.neotree")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("config.treesitter")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("config.telescope")
		end,
	},

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

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
		config = function()
			require("config.formatting")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("config.completion")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
		config = function()
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
							rustfmt = { extraArgs = { "--config", "tab_spaces=2,hard_tabs=false" } },
							check = { command = "clippy", extraArgs = { "--", "-W", "clippy::pedantic" } },
							cargo = { allFeatures = true },
							procMacro = { enable = true },
						},
					},
				},
			}
		end,
	},
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
		config = true,
	},
	{
		"joeveiga/ng.nvim",
		config = function()
			require("ng")
		end,
	},
	{
		"Equilibris/nx.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		event = { "BufReadPost nx.json", "BufNewFile nx.json" },
		cmd = { "Nx" },
		keys = {
			{ "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "Nx Actions" },
		},
		opts = {
			nx_cmd_root = nil,
			read_init = true,
		},
	},
}
