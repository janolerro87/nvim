return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", ";f", builtin.find_files, {})
      vim.keymap.set("n", ";r", builtin.live_grep, {})
      vim.keymap.set("n", "\\\\", builtin.buffers, {})

      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>ps", function ()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set("n", "<leader>pws", function ()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set("n", "<leader>pWs", function ()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)

      require("telescope").load_extension("ui-select")
    end,
  },
}
