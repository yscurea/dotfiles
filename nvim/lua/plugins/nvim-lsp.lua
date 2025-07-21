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
		"SmiteshP/nvim-navbuddy",
		lazy = true,
		event = { "LspAttach" },
		cmd = { "Navbuddy" },
		keys = {
			{ "<Leader>fs", mode = "n", cmd = "<cmd>Navbuddy<CR>", desc = "find symbols" },
		},
		config = function()
			require("nvim-navbuddy").setup({
				lsp = {
					auto_attach = true,
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
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	lazy = true,
	-- 	cmd = { "Lspsaga" },
	-- 	config = function()
	-- 		require("lspsaga").setup({})
	-- 	end,
	-- },
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
			-- {
			--   "<leader>xX",
			--   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			--   desc = "Buffer Diagnostics (Trouble)",
			-- },
			-- {
			--   "<leader>cs",
			--   "<cmd>Trouble symbols toggle focus=false<cr>",
			--   desc = "Symbols (Trouble)",
			-- },
			-- {
			--   "<leader>cl",
			--   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			--   desc = "LSP Definitions / references / ... (Trouble)",
			-- },
			-- {
			--   "<leader>xL",
			--   "<cmd>Trouble loclist toggle<cr>",
			--   desc = "Location List (Trouble)",
			-- },
			-- {
			--   "<leader>xQ",
			--   "<cmd>Trouble qflist toggle<cr>",
			--   desc = "Quickfix List (Trouble)",
			-- },
		},
	},
}
