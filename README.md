# nvim-config

Inherited [NvChad](https://github.com/NvChad/NvChad) config and made the following changes:

- Added LSP servers and formatters for C/C++, Python, Lua, Go and Svelte
- Added [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) plugin to be able to install all mason.nvim packages by one command (`:MasonInstallAll` works with LSP only in my config and not always available, whereas this plugin have no problems)
- Changed global indentation from 2 spaces to 4
- Enabled relative lines for all files

To install all Mason packages, run: `:MasonToolsInstall`

Current list:

- `autopep8`
- `black`
- `clang-format`
- `clangd`
- `css-lsp`
- `eslint_d`
- `gofumpt`
- `goimports-reviser`
- `golines`
- `gopls`
- `html-lsp`
- `lua-language-server`
- `python-lsp-server`
- `ruff`
- `stylua`
- `svelte-language-server`
- `typescript-language-server`

> Note: if you want to override formatting indentation of C/C++, you need to create `.clang-format` file in root directory of your project and change `IndentWidth: <value>` to your preferred one (by default this value is 2).
