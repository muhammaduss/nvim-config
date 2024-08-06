local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    python = { "autopep8", "black", "ruff" },
    cpp = { "clang-format" },
    go = { "goimports-reviser", "gofumpt", "golines" },
    svelte = { "eslint_d" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 50000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
