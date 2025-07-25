---@brief
---
--- https://github.com/erg-lang/erg#flags ELS
---
--- ELS (erg-language-server) is a language server for the Erg programming language.
---
--- erg-language-server can be installed via `cargo` and used as follows:
---
--- ```sh
--- cargo install erg --features els
--- erg --language-server
--- ```

return {
	cmd = { "erg", "--language-server" },
	filetypes = { "erg" },
	root_markers = { "package.er", ".git" },
}
