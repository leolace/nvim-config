vim.g.mapleader = " "

-- GENERAL
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<C-u>", ":source %<CR>")

-- switch between windows
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")

-- LSP
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- NVIMTREE
local nvimtree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", nvimtree.tree.toggle, {})

-- TOGGLETERM
vim.keymap.set("n", "<F7>", ":ToggleTerm<CR>", {})

-- BARBAR
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<A-h>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-l>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
vim.keymap.set('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)

-- close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

