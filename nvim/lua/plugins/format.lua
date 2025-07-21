---@type LazySpec[]
return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				async = true,
				default_format_opts = {
					lsp_format = "fallback",
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 3000,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					json = { "biome" },
				},
				formatters = {
					gofmt = {
						append_args = { "-s" },
					},
					biome = {
						command = "biome",
						args = {
							"check",
							"--formatter-enabled=true",
							"--linter-enabled=false",
							"--write",
							"--stdin-file-path",
							"$FILENAME",
						},
					},
				},
			})
		end,
	},
}
