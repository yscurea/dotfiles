---@brief
---
--- F# Language Server
--- https://github.com/faldor20/fsharp-language-server
---
--- An implementation of the language server protocol using the F# Compiler Service.
---
--- Build the project from source and override the command path to location of DLL.
---
--- If filetype determination is not already performed by an available plugin ([PhilT/vim-fsharp](https://github.com/PhilT/vim-fsharp), [fsharp/vim-fsharp](https://github.com/fsharp/vim-fsharp), and [adelarsq/neofsharp.vim](https://github.com/adelarsq/neofsharp.vim).
--- ), then the following must be added to initialization configuration:
---
---
--- `autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp`

local util = require("lspconfig.util")

return {
	cmd = { "dotnet", "FSharpLanguageServer.dll" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(util.root_pattern("*.sln", "*.fsproj", ".git")(fname))
	end,
	filetypes = { "fsharp" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
	settings = {},
}
