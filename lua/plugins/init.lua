return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return {
        override = {
          yaml = {
            icon = "",
            color = "#cb171e",
            name = "Yaml",
          },
          yml = {
            icon = "",
            color = "#cb171e",
            name = "Yaml",
          },
        },
      }
    end,
  },

  {
    "nvchad/base46",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  -- { "joryeugene/dadbod-grip.nvim", version = "*" },

  -- {
  --   "kndndrj/nvim-dbee",
  --   lazy = false,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   build = function()
  --     -- Install tries to automatically detect the install method.
  --     -- if it fails, try calling it with one of these parameters:
  --     --    "curl", "wget", "bitsadmin", "go"
  --     require("dbee").install()
  --   end,
  --   config = function()
  --     require("dbee").setup(--[[optional config]])
  --   end,
  -- },
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   lazy = false,
  --   opts = {
  --     -- Smear cursor when switching buffers or windows.
  --     smear_between_buffers = true,
  --
  --     -- Smear cursor when moving within line or to neighbor lines.
  --     -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
  --     smear_between_neighbor_lines = true,
  --
  --     -- Draw the smear in buffer space instead of screen space when scrolling
  --     scroll_buffer_space = true,
  --
  --     -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
  --     -- Smears and particles will look a lot less blocky.
  --     legacy_computing_symbols_support = false,
  --
  --     -- Smear cursor in insert mode.
  --     -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
  --
  --     cursor_color = "#ff4000",
  --     particles_enabled = true,
  --     stiffness = 0.5,
  --     trailing_stiffness = 0.2,
  --     trailing_exponent = 5,
  --     damping = 0.6,
  --     gradient_exponent = 0,
  --     gamma = 1,
  --     never_draw_over_target = true, -- if you want to actually see under the cursor
  --     hide_target_hack = true, -- same
  --     particle_spread = 3,
  --     particles_per_second = 300,
  --     particles_per_length = 50,
  --     particle_max_lifetime = 800,
  --     particle_max_initial_velocity = 20,
  --     particle_velocity_from_cursor = 0.5,
  --     particle_damping = 0.15,
  --     particle_gravity = -50,
  --     min_distance_emit_particles = 0,
  --   },
  -- },

  {
    "yetone/avante.nvim",
    build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      -- {
      --   "MeanderingProgrammer/render-markdown.nvim",
      --   opts = {
      --     file_types = { "markdown", "Avante" },
      --   },
      --   ft = { "markdown", "Avante" },
      -- },
    },
    config = function()
      require("avante").setup {
        instructions_file = "avante.md",
        provider = "openrouter",
        -- auto_suggestions_provider = "openrouter",
        providers = {
          openrouter = {
            __inherited_from = "openai",
            endpoint = "https://openrouter.ai/api/v1",
            api_key_name = "OPENAI_API_KEY",
            model = "stepfun/step-3.5-flash:free",
          },
        },
        behaviour = {
          auto_approve_tool_permissions = false,
          -- auto_suggestions = true,
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
        },
        -- suggestion = {
        --   debounce = 600,
        --   throttle = 600,
        -- },
      }

      local cmp = require "cmp"
      cmp.setup.filetype("Avante", {
        sources = cmp.config.sources {
          { name = "avante_mentions" },
          { name = "avante_commands" },
          { name = "avante_files" },
          { name = "avante_shortcuts" },
        },
      })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      for i = 1, 5 do
        vim.keymap.set("n", "<leader>" .. i, function()
          harpoon:list():select(i)
        end)
      end
    end,
  },

  "nvchad/volt",
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

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
        -- python = { "ruff", "bandit" },
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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,
  --
  --   priority = 49,
  -- },

  -- {
  --   "dccsillag/magma-nvim",
  --   version = "*",
  --   ft = { "ipynb" },
  --   keys = {
  --     {
  --       "<leader>mi",
  --       "<cmd>MagmaInit<CR>",
  --       desc = "This command initializes a runtime for the current buffer.",
  --     },
  --     { "<leader>mo", "<cmd>MagmaEvaluateOperator<CR>", desc = "Evaluate the text given by some operator." },
  --     { "<leader>ml", "<cmd>MagmaEvaluateLine<CR>", desc = "Evaluate the current line." },
  --     { "<leader>mv", "<cmd>MagmaEvaluateVisual<CR>", desc = "Evaluate the selected text." },
  --     { "<leader>mc", "<cmd>MagmaEvaluateOperator<CR>", desc = "Reevaluate the currently selected cell." },
  --     { "<leader>mr", "<cmd>MagmaRestart!<CR>", desc = "Shuts down and restarts the current kernel." },
  --     {
  --       "<leader>mx",
  --       "<cmd>MagmaInterrupt<CR>",
  --       desc = "Interrupts the currently running cell and does nothing if not cell is running.",
  --     },
  --   },
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "yaml",
      },
    },
  },
}
