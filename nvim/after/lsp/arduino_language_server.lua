---@brief
---
--- https://github.com/arduino/arduino-language-server
---
--- Language server for Arduino
---
--- The `arduino-language-server` can be installed by running:
---
--- ```
--- go install github.com/arduino/arduino-language-server@latest
--- ```
---
--- The `arduino-cli` tool must also be installed. Follow [these
--- installation instructions](https://arduino.github.io/arduino-cli/latest/installation/) for
--- your platform.
---
--- After installing `arduino-cli`, follow [these
--- instructions](https://arduino.github.io/arduino-cli/latest/getting-started/#create-a-configuration-file)
--- for generating a configuration file if you haven't done so already, and make
--- sure you [install any relevant platforms
--- libraries](https://arduino.github.io/arduino-cli/latest/getting-started/#install-the-core-for-your-board).
---
--- The language server also requires `clangd` to be installed. Follow [these
--- installation instructions](https://clangd.llvm.org/installation) for your
--- platform.
---
--- If you don't have a sketch yet create one.
---
--- ```sh
--- $ arduino-cli sketch new test
--- $ cd test
--- ```
---
--- You will need a `sketch.yaml` file in order for the language server to understand your project. It will also save you passing options to `arduino-cli` each time you compile or upload a file. You can generate the file by using the following commands.
---
---
--- First gather some information about your board. Make sure your board is connected and run the following:
---
--- ```sh
--- $ arduino-cli board list
--- Port         Protocol Type              Board Name  FQBN            Core
--- /dev/ttyACM0 serial   Serial Port (USB) Arduino Uno arduino:avr:uno arduino:avr
--- ```
---
--- Then generate the file:
---
--- ```sh
--- arduino-cli board attach -p /dev/ttyACM0 -b arduino:avr:uno test.ino
--- ```
---
--- The resulting file should look like this:
---
--- ```yaml
--- default_fqbn: arduino:avr:uno
--- default_port: /dev/ttyACM0
--- ```
---
--- Your folder structure should look like this:
---
--- ```
--- .
--- ├── test.ino
--- └── sketch.yaml
--- ```
---
--- For further instructions about configuration options, run `arduino-language-server --help`.
---
--- Note that an upstream bug makes keywords in some cases become undefined by the language server.
--- Ref: https://github.com/arduino/arduino-ide/issues/159

local util = require("lspconfig.util")

return {
	filetypes = { "arduino" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		on_dir(util.root_pattern("*.ino")(fname))
	end,
	cmd = {
		"arduino-language-server",
	},
	capabilities = {
		textDocument = {
			semanticTokens = vim.NIL,
		},
		workspace = {
			semanticTokens = vim.NIL,
		},
	},
}
