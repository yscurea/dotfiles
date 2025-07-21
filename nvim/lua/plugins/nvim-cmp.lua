---@type LazySpec[]
return {
	{
		"saghen/blink.cmp",
		event = { "CmdlineEnter", "InsertEnter" },
		dependencies = { "rafamadriz/friendly-snippets", lazy = true },
		version = "1.*",
		build = "cargo build --release",
		config = function()
			local blink = require("blink.cmp")
			blink.setup({
				keymap = {
					preset = "none",
					["<Tab>"] = {
						function(cmp)
							if cmp.snippet_active() then
								return cmp.accept()
							else
								return cmp.select_and_accept()
							end
						end,
						"snippet_forward",
						"fallback",
					},
					["<CR>"] = {
						function(cmp)
							if cmp.snippet_active() then
								return cmp.accept()
							else
								return cmp.select_and_accept()
							end
						end,
						"snippet_forward",
						"fallback",
					},
					["<S-Tab>"] = { "snippet_backward", "fallback" },
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
					["<C-e>"] = { "hide" },
					["<C-y>"] = { "select_and_accept" },
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback_to_mappings" },
					["<C-n>"] = { "select_next", "fallback_to_mappings" },
					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },
					["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = {
					documentation = { auto_show = false },
					accept = {
						auto_brackets = {
							enabled = true,
						},
					},
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
			})
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
}
