require("vim-options")
require("vim-keymaps")
require("config.lazy")

vim.keymap.set("n", "<leader>l", ":Lazy<Return>")
vim.keymap.set("n", "<leader>m", ":Mason<Return>")
