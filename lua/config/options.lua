vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.title = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 999

vim.opt.cmdheight = 2
vim.opt.showcmd = true
vim.opt.laststatus = 2

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false
vim.opt.backspace = "start,eol,indent"

vim.opt.list = true
vim.opt.listchars = "eol:$,tab:▸␣,trail:~,extends:>,precedes:<"
-- vim.opt.listchars = 'eol:$,tab:>-,trail:~,extends:>,precedes:<'

vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
-- vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })

vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5
vim.opt.background = "dark"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]])

vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

vim.g.python3_host_prog = "/usr/bin/python"
vim.g.loaded_perl_provider = 0
