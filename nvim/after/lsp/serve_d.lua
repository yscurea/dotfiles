---@brief
---
--- https://github.com/Pure-D/serve-d
---
--- Microsoft language server protocol implementation for D using workspace-d.
--- Download a binary from https://github.com/Pure-D/serve-d/releases and put it in your $PATH.
return {
	cmd = { "serve-d" },
	filetypes = { "d" },
	root_markers = { "dub.json", "dub.sdl", ".git" },
}
