# nvim-config

Inherited [NvChad](https://github.com/NvChad/NvChad) config and made the following changes:

- Added LSP servers and formatters for C, C++, Python, and Lua
- Changed global indentation from 2 spaces to 4
- Enabled relative lines for all files

Mason packages:

- `autopep8`
- `black`
- `clang-format`
- `clangd`
- `lua-language-server`
- `python-lsp-server`
- `ruff`
- `stylua`

> Note: if you want to override formatting indentation of C/C++, you need to create `.clang-format` file in root directory of your project and change `IndentWidth: <value>` to your preferred one (by default this value is 2).
