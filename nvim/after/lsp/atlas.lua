---@brief
---
--- https://github.com/ariga/atlas
---
--- Language server for Atlas config and schema files.
---
--- You may also need to configure the filetype for *.hcl files:
---
--- ```vim
--- autocmd BufNewFile,BufRead atlas.hcl set filetype=atlas-config
--- autocmd BufNewFile,BufRead *.my.hcl set filetype=atlas-schema-mysql
--- autocmd BufNewFile,BufRead *.pg.hcl set filetype=atlas-schema-postgresql
--- autocmd BufNewFile,BufRead *.lt.hcl set filetype=atlas-schema-sqlite
--- autocmd BufNewFile,BufRead *.ch.hcl set filetype=atlas-schema-clickhouse
--- autocmd BufNewFile,BufRead *.ms.hcl set filetype=atlas-schema-mssql
--- autocmd BufNewFile,BufRead *.rs.hcl set filetype=atlas-schema-redshift
--- autocmd BufNewFile,BufRead *.test.hcl set filetype=atlas-test
--- autocmd BufNewFile,BufRead *.plan.hcl set filetype=atlas-plan
--- autocmd BufNewFile,BufRead *.rule.hcl set filetype=atlas-rule
--- ```
---
--- or
---
--- ```lua
--- vim.filetype.add({
---   filename = {
---     ['atlas.hcl'] = 'atlas-config',
---   },
---   pattern = {
---     ['.*/*.my.hcl'] = 'atlas-schema-mysql',
---     ['.*/*.pg.hcl'] = 'atlas-schema-postgresql',
---     ['.*/*.lt.hcl'] = 'atlas-schema-sqlite',
---     ['.*/*.ch.hcl'] = 'atlas-schema-clickhouse',
---     ['.*/*.ms.hcl'] = 'atlas-schema-mssql',
---     ['.*/*.rs.hcl'] = 'atlas-schema-redshift',
---     ['.*/*.test.hcl'] = 'atlas-test',
---     ['.*/*.plan.hcl'] = 'atlas-plan',
---     ['.*/*.rule.hcl'] = 'atlas-rule',
---   },
--- })
--- ```
---
--- Optionally, tell treesitter to treat Atlas filetypes as HCL for better syntax highlighting:
---
--- ```lua
--- vim.treesitter.language.register('hcl', 'atlas-config')
--- vim.treesitter.language.register('hcl', 'atlas-schema-mysql')
--- vim.treesitter.language.register('hcl', 'atlas-schema-postgresql')
--- vim.treesitter.language.register('hcl', 'atlas-schema-sqlite')
--- vim.treesitter.language.register('hcl', 'atlas-schema-clickhouse')
--- vim.treesitter.language.register('hcl', 'atlas-schema-mssql')
--- vim.treesitter.language.register('hcl', 'atlas-schema-redshift')
--- vim.treesitter.language.register('hcl', 'atlas-test')
--- vim.treesitter.language.register('hcl', 'atlas-plan')
--- vim.treesitter.language.register('hcl', 'atlas-rule')
--- ```
---
return {
	cmd = { "atlas", "tool", "lsp", "--stdio" },
	filetypes = {
		"atlas-*",
	},
	root_markers = { "atlas.hcl" },
}
