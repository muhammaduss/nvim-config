## What is it?

Clone of [NvChad](https://github.com/NvChad/NvChad/) config for [Neovim](https://github.com/neovim/neovim).

## Custom changes

- Relative number of lines shows always
- Default tabspace set to 4
- Customization of ui config in `lua/chadrc.lua`
- New plugins added in `lua/plugins.lua`

### LSP, Linters & Formatters
Added lsp in `lua/configs/lspconfig.lua`, formatters in `lua/configs/conform.lua` and linters configuration in `nvim-lint` plugin specification. Current setup done for:
- Python
- Lua (except linter)
- HTML/CSS/JS/TS
- Svelte
- React

## Installation

Clone repo and it should work with basic configs. 

To use lsp, linters and formatters for listed languages, make sure you have:
- Python 3.12.3
    - python3-pip
    - python3-venv
- Node v23.10.0
- npm 10.9.2

> Note: it is not necessarily that only those versions will work, maybe python 3.11 or other versions is also okay 

Then, use on command bar `:MasonInstallAll` to install all toolings by `mason.nvim` (included in plugins).

Also you can run `:TSInstall <language>` with desired language (base syntax highlighting).