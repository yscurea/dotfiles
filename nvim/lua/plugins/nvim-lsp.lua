return {
	{ "b0o/SchemaStore.nvim", lazy = true },
	{
		"folke/lazydev.nvim",
		ft = "lua",
		config = function()
			require("lazydev").setup({
				library = {
					"lazy.nvim",
					"luvit-meta/library",
					"plenary.nvim",
					"${3rd}/busted/library",
					"${3rd}/luassert/library",
				},
			})
		end,
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"ray-x/lsp_signature.nvim",
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup({
				notification = {
					-- filter = vim.log.levels.DEBUG,
					view = {
						stack_upwards = false,
					},
				},
				integration = {
					["nvim-tree"] = {
						enable = false,
					},
				},
			})
		end,
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		config = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
				},
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		tag = "v2.3.0",
		lazy = true,
		config = function()
			local ls = require("luasnip")
			ls.setup({
				history = true,
				update_events = "TextChanged, TextChangedI",
			})
		end,
	},
	{ "rafamadriz/friendly-snippets", lazy = true },
	{ "onsails/lspkind.nvim", lazy = true },
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>fd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
}
