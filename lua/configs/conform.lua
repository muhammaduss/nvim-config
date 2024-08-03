local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- c_cpp = { "clang-format" }, -- Hack to force download.
    c = { "clang-format" },
    python = { "autopep8", "black", "ruff" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 50000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
