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
  }
}
