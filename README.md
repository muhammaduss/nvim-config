## Custom changes

- Added showing relative number, changed tabspace to 4
- Custom ui config in `lua/chadrc.lua`
- Plugins in `lua/plugins.lua`
- Added several lsp in `lua/configs/lspconfig.lua` and formatters & linters in `lua/configs/conform.lua`. You may use `:MasonInstallAll` to install everything by `mason.nvim`.

Base setup done for:
- Python
- C/C++
- Lua
- Haskell
- PHP
- Yaml
- HTML/CSS
- Go
- Svelte
- Typescript
- React

Also you may need to run `:TSInstall <language>` with desired language (base syntax highlighting).

## What is it?
**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!

