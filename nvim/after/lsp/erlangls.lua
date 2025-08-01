---@brief
---
--- https://erlang-ls.github.io
---
--- Language Server for Erlang.
---
--- Clone [erlang_ls](https://github.com/erlang-ls/erlang_ls)
--- Compile the project with `make` and copy resulting binaries somewhere in your $PATH eg. `cp _build/*/bin/* ~/local/bin`
---
--- Installation instruction can be found [here](https://github.com/erlang-ls/erlang_ls).
---
--- Installation requirements:
---     - [Erlang OTP 21+](https://github.com/erlang/otp)
---     - [rebar3 3.9.1+](https://github.com/erlang/rebar3)
return {
	cmd = { "erlang_ls" },
	filetypes = { "erlang" },
	root_markers = { "rebar.config", "erlang.mk", ".git" },
}
