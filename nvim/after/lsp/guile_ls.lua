---@brief
---
--- https://codeberg.org/rgherdt/scheme-lsp-server
---
--- The recommended way is to install guile-lsp-server is using Guix. Unfortunately it is still not available at the official Guix channels, but you can use the provided channel guix.scm in the repo:
--- ```sh
--- guix package -f guix.scm
--- ```
---
--- Checkout the repo for more info.
---
--- Note: This LSP will start on `scheme.guile` filetype. You can set this file type using `:help modeline` or adding https://gitlab.com/HiPhish/guile.vim to your plugins to automatically set it.
return {
	cmd = { "guile-lsp-server" },
	filetypes = {
		"scheme.guile",
	},
	root_markers = { "guix.scm", ".git" },
}
