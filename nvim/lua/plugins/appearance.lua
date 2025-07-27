return {
	{
		"danilamihailov/beacon.nvim",
		event = "CursorMoved",
	},
	{
		"folke/noice.nvim",
		event = { "CmdlineEnter" },
		lazy = true,
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline_popup",
					opts = {},
					format = {
						cmdline = { pattern = "^:", icon = "", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
						lua = {
							pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
							icon = "",
							lang = "lua",
						},
						help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
						input = { view = "cmdline_input", icon = "󰥻 " },
					},
				},
				messages = {
					enabled = false,
				},
				popupmenu = {
					enabled = false,
				},
				notify = {
					enabled = false,
				},
				lsp = {
					progress = {
						enabled = false,
					},
					hover = {
						enabled = false,
						silent = false,
						view = nil,
						opts = {},
					},
					signature = {
						enabled = true,
					},
					message = {
						enabled = false,
					},
				},
				presets = {
					bottom_search = false,
					command_palette = false,
					long_message_to_split = false,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})
		end,
	},
	{
		"shortcuts/no-neck-pain.nvim",
		lazy = true,
		keys = {
			{ "<Leader>z", "<cmd>NoNeckPain<CR>", mode = { "n" }, desc = "Toggle no neck pain" },
		},
		version = "*",
	},
	{
		"akinsho/bufferline.nvim",
		lazy = true,
		event = "BufAdd",
		keys = {
			{ "<s-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Next buffer", mode = "n" },
			{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Prev buffer", mode = "n" },
			{ "<Leader><", "<cmd>BufferLineMovePrev<CR>", desc = "Buffer move prev", mode = "n" },
			{ "<Leader>>", "<cmd>BufferLineMoveNext<CR>", desc = "Buffer move next", mode = "n" },
		},
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					offsets = {},
					separator_style = "thick",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(count, level, _, _)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
				},
			})
		end,
	},
	{
		"kazhala/close-buffers.nvim",
		lazy = true,
		keys = {
			{
				"<Leader>x",
				function()
					require("close_buffers").delete({ type = "this" })
				end,
				mode = "n",
				desc = "Close current buffer",
			},
			{
				"<Leader>ca",
				function()
					require("close_buffers").delete({ type = "all" })
				end,
				mode = "n",
				desc = "Close all buffers",
			},
			{
				"<Leader>co",
				function()
					require("close_buffers").delete({ type = "other" })
				end,
				mode = "n",
				desc = "Close others buffers",
			},
		},
		config = function()
			require("close_buffers").setup({})
		end,
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "WinResized" },
		config = function()
			require("colorful-winsep").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "BufReadPost",
		lazy = true,
		config = function()
			local clients_lsp = function()
				local clients = {}
				for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
					if client.name == "null-ls" then
						local sources = {}
						for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
							sources[source.name] = true
						end
						local names = {}
						for k, _ in pairs(sources) do
							table.insert(names, k)
						end
						table.insert(clients, "null-ls(" .. table.concat(names, ", ") .. ")")
					else
						table.insert(clients, client.name)
					end
				end
				return " " .. table.concat(clients, ", ")
			end
			local navic = require("nvim-navic")
			vim.o.winbar = "󱞄"
			require("lualine").setup({
				options = {
					theme = "auto",
					disabled_filetypes = {
						statusline = { "packer", "NvimTree" },
						winbar = { "packer", "NvimTree" },
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_x = { clients_lsp },
					lualine_y = { "fileformat", "filetype", "encoding" },
					lualine_z = { "progress", "location" },
				},
				winbar = {
					lualine_c = {
						{
							function()
								return navic.get_location()
							end,
							cond = function()
								return navic.is_available()
							end,
						},
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.icons",
		version = "*",
		config = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("mini.icons")
			require("nvim-web-devicons").setup({
				override = {
					zsh = {
						icon = "",
						color = "#428850",
						cterm_color = "65",
						name = "Zsh",
					},
				},
				color_icons = true,
				default = true,
				strict = true,
				variant = "light|dark",
				override_by_filename = {
					[".gitignore"] = {
						icon = "",
						color = "#f1502f",
						name = "Gitignore",
					},
				},
				override_by_extension = {
					["log"] = {
						icon = "",
						color = "#81e043",
						name = "Log",
					},
				},
				override_by_operating_system = {
					["apple"] = {
						icon = "",
						color = "#A2AAAD",
						cterm_color = "248",
						name = "Apple",
					},
				},
			})
		end,
	},
	{
		"myusuf3/numbers.vim",
		event = "InsertEnter",
		lazy = true,
		init = function()
			vim.g.numbers_exclude = {
				"tagbar",
				"NvimTree",
				"nerdtree",
				"gundo",
				"minibufexpl",
				"toggleterm",
				"dashboard",
				"packer",
				"mason",
			}
		end,
	},
	{
		"DaikyXendo/nvim-material-icon",
		lazy = true,
	},
	{
		"stevearc/oil.nvim",
		keys = {
			{ "<Leader>e", "<Cmd>Oil --float<CR>", desc = "open file tree", mode = { "n" } },
		},
		cmd = {
			"Oil",
		},
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
				float = {
					max_width = 120,
				},
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = {
						"actions.select",
						opts = { vertical = true },
						desc = "Open the entry in a vertical split",
					},
					["<C-h>"] = {
						"actions.select",
						opts = { horizontal = true },
						desc = "Open the entry in a horizontal split",
					},
					["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<Esc>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = {
						"actions.cd",
						opts = { scope = "tab" },
						desc = ":tcd to the current oil directory",
						mode = "n",
					},
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
					["g\\"] = "actions.toggle_trash",
				},
			})
		end,
	},
	{
		"unblevable/quick-scope",
		event = "CursorMoved",
		lazy = true,
	},
	{
		"RRethy/vim-illuminate",
		event = "CursorMoved",
		lazy = true,
		config = function()
			require("illuminate").configure({
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
			})
		end,
	},
}
