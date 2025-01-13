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
