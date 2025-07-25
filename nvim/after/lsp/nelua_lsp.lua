--- @brief
---
--- https://github.com/codehz/nelua-lsp
---
--- nelua-lsp is an experimental nelua language server.
---
--- You need [nelua.vim](https://github.com/stefanos82/nelua.vim/blob/main/ftdetect/nelua.vim) for nelua files to be recognized or add this to your config:
---
--- in vimscript:
--- ```vimscript
--- au BufNewFile,BufRead *.nelua setf nelua
--- ```
---
--- in lua:
--- ```lua
--- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { pattern = { "*.nelua" }, command = "setf nelua"})
--- ```
---
--- **By default, nelua-lsp doesn't have a `cmd` set.** This is because nvim-lspconfig does not make assumptions about your path. You must add the following to your init.vim or init.lua to set `cmd` to the absolute path ($HOME and ~ are not expanded) of the unzipped run script or binary.
---
--- ```lua
--- vim.lsp.config('nelua_lsp', {
---     cmd = { "nelua", "-L", "/path/to/nelua-lsp/", "--script", "/path/to/nelua-lsp/nelua-lsp.lua" },
--- })
--- ```
return {
	filetypes = { "nelua" },
	root_markers = { "Makefile", ".git", "*.nelua" },
}
