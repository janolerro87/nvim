local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("vim-keymaps")
require("lazy").setup({
  spec = "plugins",
  change_detection = { notify = false },
  checker = {
    enabled = true,
    notify = true,
    frequency = 3600
  }
})


vim.keymap.set("n", "<leader>l", ":Lazy<Return>")
vim.keymap.set("n", "<leader>m", ":Mason<Return>")
