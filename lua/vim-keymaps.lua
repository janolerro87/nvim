local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<c-k>", ":wincmd k<Return>")
keymap.set("n", "<c-j>", ":wincmd j<Return>")
keymap.set("n", "<c-h>", ":wincmd h<Return>")
keymap.set("n", "<c-l>", ":wincmd l<Return>")
keymap.set("n", "<leader>h", ":nohlsearch<Return>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "Q", "<nop>")

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "sd", ":bd<Return>", opts)
keymap.set("n", "sw", ":w<Return>")
keymap.set("n", "sq", ":q<Return>")
keymap.set("", "sx", "<cmd>close<Return>")
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)

-- Move window
-- keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<dow>", "<C-w>j")
keymap.set("", "s<right>", "<C-w>l")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

keymap.set('n', '[<Space>', 'm`O<Esc>``')
keymap.set('n', ']<Space>', 'm`o<Esc>``')

-- keymap.set("n", "<C-j>", function ()
--   vim.diagnostic.goto_next()
-- end, opts)
