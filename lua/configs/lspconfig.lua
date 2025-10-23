-- Initialize nvim-lspconfig to make its server configs available
-- This line is still needed for the plugin to add its configs to the runtime path :cite[4]
require "lspconfig"

-- Load NVChad's default LSP configurations
require("nvchad.configs.lspconfig").defaults()

-- Define global defaults for all LSP servers :cite[4]
local nvlsp = require "nvchad.configs.lspconfig"
vim.lsp.config("*", {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  flags = nvlsp.lsp_flags,
})

-- List of servers to enable
local servers = {
  "lua_ls",
  "ts_ls",
  "html",
  "clangd",
  "cssls",
  "dockerls",
  "gopls",
  "svelte",
  "basedpyright",
  "marksman",
  "yamlls",
}

-- For yamlls
vim.lsp.config("yamlls", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true -- I add this line
  end,
  settings = {
    yaml = {
      schemas = {
        kubernetes = { "k8s.yaml", "templates/*" },
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
      },
      format = {
        enable = false,
      },
      schemaStore = {
        enable = true,
      },
    },
  },
})

vim.lsp.enable(servers)

-- For clangd with custom on_attach
local custom_on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    custom_on_attach(client, bufnr)
  end,
})

-- For lua_ls with custom runtime path detection
vim.lsp.config("lua_ls", {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
})
