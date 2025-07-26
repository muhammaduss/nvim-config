return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  "nvchad/volt",
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {

    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        css = { "stylelint" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        html = { "htmlhint" },
        svelte = { "eslint_d" },
        python = { "ruff", "bandit" },
        dockerfile = { "hadolint" },
        yaml = { "yamllint" },
        go = { "revive" },
        c = { "cpplint" },
        cpp = { "cpplint" },
      }

      local manual_linters = {
        yaml = { "actionlint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
        local original_linters = vim.deepcopy(lint.linters_by_ft)
        for ft, linters in pairs(manual_linters) do
          lint.linters_by_ft[ft] = lint.linters_by_ft[ft] or {}
          vim.list_extend(lint.linters_by_ft[ft], linters)
        end
        lint.try_lint()
        -- Restore original linters
        lint.linters_by_ft = original_linters
      end, { desc = "Trigger linting for current file" })
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    priority = 49,
  },

  {
    "dccsillag/magma-nvim",
    version = "*",
    lazy = false, -- workaround while debugging other stuff
    ft = { "ipynb" },
    keys = {
      {
        "<leader>mi",
        "<cmd>MagmaInit<CR>",
        desc = "This command initializes a runtime for the current buffer.",
      },
      { "<leader>mo", "<cmd>MagmaEvaluateOperator<CR>", desc = "Evaluate the text given by some operator." },
      { "<leader>ml", "<cmd>MagmaEvaluateLine<CR>", desc = "Evaluate the current line." },
      { "<leader>mv", "<cmd>MagmaEvaluateVisual<CR>", desc = "Evaluate the selected text." },
      { "<leader>mc", "<cmd>MagmaEvaluateOperator<CR>", desc = "Reevaluate the currently selected cell." },
      { "<leader>mr", "<cmd>MagmaRestart!<CR>", desc = "Shuts down and restarts the current kernel." },
      {
        "<leader>mx",
        "<cmd>MagmaInterrupt<CR>",
        desc = "Interrupts the currently running cell and does nothing if not cell is running.",
      },
    },
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
