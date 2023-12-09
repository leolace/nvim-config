vim.g.mapleader = " "

-- general
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<C-u>", ":source %<CR>")

-- lsp
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- switch between windows
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")

-- nvimtree
local nvimtree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", nvimtree.tree.toggle, {})

-- toggleterm
vim.keymap.set("n", "<F7>", ":ToggleTerm<CR>", {})

