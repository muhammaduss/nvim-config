-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "lua_ls",
  "ts_ls",
  "html",
  "cssls",
  -- "phpactor",
  -- "hls",
  "dockerls",
  "gopls",
  "svelte",
  "basedpyright",
  -- "docker_compose_language_service",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig.hls.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--     nvlsp.on_attach(client, bufnr)
--   end,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

lspconfig.yamlls.setup {
  on_attach = function(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = true
    nvlsp.on_attach(client, bufnr)
  end,
  flags = nvlsp.lsp_flags,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemas = {
        -- ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.33.0-standalone-strict/all.json"] = "k8s-*.yaml",
        kubernetes = { "k8s.yaml", "templates/*" },
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- require("lspconfig").phpactor.setup {
--   root_dir = function(_)
--     return vim.loop.cwd()
--   end,
--   init_options = {
--     ["language_server.diagnostics_on_update"] = false,
--     ["language_server.diagnostics_on_open"] = false,
--     ["language_server.diagnostics_on_save"] = false,
--     ["language_server_phpstan.enabled"] = false,
--     ["language_server_psalm.enabled"] = false,
--   },
-- }
--
require("lspconfig").lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
    })
  end,
  settings = {
    Lua = {},
  },
}
