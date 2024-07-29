return {
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function ()
      require("Comment").setup({})
    end
  },
  -- {
  --   "tpope/vim-unimpaired",
  -- },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function ()
      require("colorizer").setup({
        "*"
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    lazy = false,
    config = function ()
      require("nvim-autopairs").setup({
        disable_filetype = {
          "TelescopePrompt",
          "vim"
        }
      })
    end
  },
  {
    "johnfrankmorgan/whitespace.nvim",
    lazy = false,
    config = function ()
      local whitespace = require("whitespace-nvim")

      whitespace.setup({
        highlight = "DiffDelete",
        ignored_filetypes = {
          "TelescopePrompt",
          "Trouble",
          "help",
          "lazy",
          "mason",
          "alpha",
          "noice",
          "notify"
        }
      })

      vim.keymap.set("n", "st", whitespace.trim)
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "VeryLazy",
    opts = {},
    -- config = function ()
    --     local tc = require("todo-comments")
    --     vim.keymap.set("n", "]t", function()
    --         tc.jump_next()
    --     end, { desc = "Next todo comment" })
    --
    --     vim.keymap.set("n", "[t", function()
    --         tc.jump_prev()
    --     end, { desc = "Previous todo comment" })
    --
    --     -- You can also specify a list of valid jump keywords
    --
    --     vim.keymap.set("n", "]t", function()
    --         tc.jump_next({keywords = { "ERROR", "WARNING" }})
    --     end, { desc = "Next error/warning todo comment" })
    -- end,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
