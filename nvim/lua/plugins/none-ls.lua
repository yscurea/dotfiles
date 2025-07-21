---@type LazySpec[]
return {
	{
		"nvimtools/none-ls.nvim",
		event = { "LspAttach" },
		lazy = true,
		config = function()
			local cspell = require("cspell")
			require("null-ls").setup({
				sources = {
					cspell.diagnostics.with({
						diagnostics_postprocess = function(diagnostic)
							diagnostic.severity = vim.diagnostic.severity.HINT
						end,
					}),
					cspell.code_actions,
				},
			})
		end,
	},
	{ "davidmh/cspell.nvim", lazy = true },
}
