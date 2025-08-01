return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		keys = {
			{
				"<leader>gll",
				"<cmd>lua require('gitsigns').toggle_linehl()<CR>",
				desc = "Toggle Git Signs Line Highlight",
				mode = { "n" },
			},
			{ "<Leader>gln", "<cmd>lua require('gitsigns').toggle_numhl()<CR>", desc = "toggle_numhl", mode = { "n" } },
			{ "<Leader>gls", "<cmd>lua require('gitsigns').toggle_signs()<CR>", desc = "toggle_signs", mode = { "n" } },
			{ "<Leader>gs", "<cmd>lua require('gitsigns').show()<CR>", desc = "show", mode = { "n" } },
			{ "<Leader>ghN", "<cmd>lua require('gitsigns').nav_hunk()<CR>", desc = "nav_hunk", mode = { "n" } },
			{ "<Leader>ghg", "<cmd>lua require('gitsigns').get_hunks()<CR>", desc = "get_hunks", mode = { "n" } },
			{ "<Leader>ghn", "<cmd>lua require('gitsigns').next_hunk()<CR>", desc = "next_hunk", mode = { "n" } },
			{ "<Leader>ghp", "<cmd>lua require('gitsigns').prev_hunk()<CR>", desc = "prev_hunk", mode = { "n" } },
			{ "<Leader>ghr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", desc = "reset_hunk", mode = { "n" } },
			{ "<Leader>gha", "<cmd>lua require('gitsigns').stage_hunk()<CR>", desc = "stage_hunk", mode = { "n" } },
			{ "<Leader>ghs", "<cmd>lua require('gitsigns').select_hunk()<CR>", desc = "select_hunk", mode = { "n" } },
			{ "<Leader>ghP", "<cmd>lua require('gitsigns').preview_hunk()<CR>", desc = "preview_hunk", mode = { "n" } },
			{ "<Leader>gq", "<cmd>lua require('gitsigns').setqflist()<CR>", desc = "setqflist", mode = { "n" } },
			{ "<Leader>gQ", "<cmd>lua require('gitsigns').setqflist('all')<CR>", desc = "setqflist", mode = { "n" } },
			{ "<Leader>gfl", "<cmd>lua require('gitsigns').setloclist()<CR>", desc = "setloclist", mode = { "n" } },
			{ "<Leader>grb", "<cmd>lua require('gitsigns').reset_buffer()<CR>", desc = "reset_buffer", mode = { "n" } },
			{ "<Leader>gab", "<cmd>lua require('gitsigns').stage_buffer()<CR>", desc = "stage_buffer", mode = { "n" } },
			{ "<Leader>gdt", "<cmd>lua require('gitsigns').diffthis()<CR>", desc = "diffthis", mode = { "n" } },
			{
				"<Leader>gdw",
				"<cmd>lua require('gitsigns').toggle_word_diff()<CR>",
				desc = "toggle_word_diff",
				mode = { "n" },
			},
			{ "<Leader>gB", "<cmd>lua require('gitsigns').blame()<CR>", desc = "blame", mode = { "n" } },
			{
				"<Leader>gb",
				"<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
				desc = "toggle_current_line_blame",
				mode = { "n" },
			},
		},
		config = function()
			require("gitsigns").setup({})
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		keys = {
			{
				"<leader>gcl",
				"<cmd>GitConflictListQf<cr>",
				mode = { "n" },
				desc = "git conflict list qf",
			},
			{
				"<leader>gcn",
				"<cmd>GitConflictNextConflict<cr>",
				mode = { "n" },
				desc = "git conflict next conflict",
			},
			{
				"<leader>gcp",
				"<cmd>GitConflictPrevConflict<cr>",
				mode = { "n" },
				desc = "git conflict prev conflict",
			},
			{
				"<leader>gco",
				"<cmd>GitConflictChooseOurs<cr>",
				mode = { "n" },
				desc = "git conflict choose ours",
			},
			{
				"<leader>gct",
				"<cmd>GitConflictChooseTheirs<cr>",
				mode = { "n" },
				desc = "git conflict choose theirs",
			},
			{
				"<leader>gcp",
				"<cmd>GitConflictChooseBoth<cr>",
				mode = { "n" },
				desc = "git conflict choose both",
			},
		},
		lazy = true,
		config = true,
	},
}
