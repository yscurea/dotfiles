return {
	{
		"github/copilot.vim",
		lazy = true,
		event = "InsertEnter",
		config = function()
			vim.keymap.set("i", "<C-CR>", 'copilot#Accept("\\<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
			vim.g.copilot_no_tab_map = false
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = true,
		keys = {
			{ "<C-l>", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat", mode = { "n", "i" } },
		},
		cmd = {
			"CopilotChat",
			"CopilotChatContext",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatStop",
			"CopilotChatReset",
			"CopilotChatSave",
			"CopilotChatLoad",
			"CopilotChatPrompts",
			"CopilotChatModels",
			"CopilotChatAgents",
		},
		-- build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			require("CopilotChat").setup({
				mappings = {
					reset = {
						normal = "<C-r>",
						insert = "<C-r>",
					},
					show_diff = {
						full_diff = true,
					},
				},
			})
		end,
	},
}
