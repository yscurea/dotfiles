---@brief
---
--- https://github.com/shader-slang/slang
---
--- The `slangd` binary can be downloaded as part of [slang releases](https://github.com/shader-slang/slang/releases) or
--- by [building `slang` from source](https://github.com/shader-slang/slang/blob/master/docs/building.md).
---
--- The server can be configured by passing a "settings" object to vim.lsp.config('slangd'):
---
--- ```lua
--- vim.lsp.config('slangd', {
---   settings = {
---     slang = {
---       predefinedMacros = {"MY_VALUE_MACRO=1"},
---       inlayHints = {
---         deducedTypes = true,
---         parameterNames = true,
---       }
---     }
---   }
--- })
--- ```
--- Available options are documented [here](https://github.com/shader-slang/slang-vscode-extension/tree/main?tab=readme-ov-file#configurations)
--- or in more detail [here](https://github.com/shader-slang/slang-vscode-extension/blob/main/package.json#L70).

local bin_name = "slangd"

if vim.fn.has("win32") == 1 then
	bin_name = "slangd.exe"
end

return {
	cmd = { bin_name },
	filetypes = { "hlsl", "shaderslang" },
	root_markers = { ".git" },
}
