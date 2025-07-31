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

vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

vim.g.python3_host_prog = "/usr/bin/python"
vim.g.loaded_perl_provider = 0

vim.hl.priorities.semantic_tokens = 95

vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
    format = function(diagnostic)
      local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
      return string.format("%s %s", code, diagnostic.message)
    end,
    update_in_insert = true,
    float = {
      source = true,
    },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = ' ',
        [vim.diagnostic.severity.WARN] = ' ',
        [vim.diagnostic.severity.INFO] = ' ',
        [vim.diagnostic.severity.HINT] = '󰌵 ',
      },
    },
    on_ready = function ()
      vim.cmd "highlight DiagnosticVirtualText guibg=NONE"
    end,
  }
}

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.cmd [[
  augroup kitty_mp
  autocmd!
  au VimLeave * :silent !kitty @ set-spacing padding=default margin=default
  au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0 3 0 3
  augroup END
]]
