local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "autopep8", "ruff", "black" },
    php = { "php" },
    haskell = { "ormolu", "hlint", "fourmolu", "stylish-haskell" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    php = {
      command = "php-cs-fixer",
      args = {
        "fix",
        "$FILENAME",
        "--config=/home/muhammad/devops-em/.php-cs-fixer.dist.php",
        "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
      },
      stdin = false,
    },
  },
}

return options
