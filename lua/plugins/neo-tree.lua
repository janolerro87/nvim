return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function ()
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<Return>")
    vim.keymap.set("n", "<leader>b", ":Neotree buffers toggle float<Return>")
  end
}
