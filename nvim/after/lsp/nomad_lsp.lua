---@brief
---
--- https://github.com/juliosueiras/nomad-lsp
---
--- Written in Go, compilation is needed for `nomad_lsp` to be used. Please see the [original repository](https://github.com/juliosuieras/nomad-lsp).
---
--- Add the executable to your system or vim PATH and it will be set to go.
---
--- No configuration option is needed unless you choose not to add `nomad-lsp` executable to the PATH. You should know what you are doing if you choose so.
---
--- ```lua
--- vim.lsp.enable('nomad_lsp')
--- ```
---
--- However, a `hcl.nomad` or `nomad` filetype should be defined.
---
--- Description of your jobs should be written in `.nomad` files for the LSP client to configure the server's `root_dir` configuration option.

local util = require("lspconfig.util")
local bin_name = "nomad-lsp"

if vim.fn.has("win32") == 1 then
	bin_name = bin_name .. ".exe"
end

return {
	cmd = { bin_name },
	filetypes = { "hcl.nomad", "nomad" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(util.root_pattern("*.nomad")(fname))
	end,
}
