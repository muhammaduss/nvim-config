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
- Dockerfile
- Yaml (except formatter)
- Go
- C/C++

## Installation

Check out installation [guide](https://nvchad.com/docs/quickstart/install) for NvChad and ensure pre-requisities from there installed.

Then, clone this repo (example for Linux by HTTPS, also make sure to backup your previous config if you need it)
```bash
https://github.com/muhammaduss/nvim-config.git ~/.config/nvim && nvim
```

Now it should work, but for better experience: to use lsp, linters and formatters for listed languages and tools above, you might need:
- Python 3.12.3
    - python3-pip
    - python3-venv
- Node v23.10.0
- npm 10.9.2
- go 1.24.3
- (optional) frontend linters:
    - linter for CSS: [stylelint-config-standard](https://www.npmjs.com/package/stylelint-config-standard/v/25.0.0) and create file .stylelintrc.json, [example](https://stylelint.io/user-guide/configure/#extends) how to fill
    - linter for all other toolings: eslint (config file and packages specification were builtin while creating react/svelte projects, in that case if all npm packages of project installed - no need to install eslint by hand)

> Note: it is not necessarily that only those versions will work, for example python 3.11 or other versions is also okay 

Then, use on command bar `:MasonInstallAll` to install all toolings by `mason.nvim` (included in plugins).

Also you can run `:TSInstall <language>` with desired language (base syntax highlighting).
