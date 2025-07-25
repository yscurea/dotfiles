---@brief
---
--- https://ruby-syntax-tree.github.io/syntax_tree/
---
--- A fast Ruby parser and formatter.
---
--- Syntax Tree is a suite of tools built on top of the internal CRuby parser. It
--- provides the ability to generate a syntax tree from source, as well as the
--- tools necessary to inspect and manipulate that syntax tree. It can be used to
--- build formatters, linters, language servers, and more.
---
--- ```sh
--- gem install syntax_tree
--- ```
return {
	cmd = { "stree", "lsp" },
	filetypes = { "ruby" },
	root_markers = { ".streerc", "Gemfile", ".git" },
}
