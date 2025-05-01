return {
  {
    "folke/trouble.nvim",
    config = function ()
      require("trouble").setup()

      -- vim.keymap.set("n", "<leader>tt", function ()
      --   require("trouble").toggle()
      -- end)

      vim.keymap.set("n", "<leader>tn", function ()
        require("trouble").next({ skip_group = true, jump = true})
      end)

      vim.keymap.set("n", "<leader>tp", function ()
        require("trouble").prev({ skip_group = true, jump = true})
      end)
    end,
    keys = {
      { "<leader>tt", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>" },
      { "<leader>tl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)",
    },
    }
  }
}
