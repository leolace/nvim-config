vim.g.mapleader = " "

-- GENERAL
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<C-u>", ":source %<CR>")

-- switch between windows
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })

-- terminal mode
vim.keymap.set("t", "<Esc>", "<cmd>:q<CR>")

-- resize window
vim.keymap.set("n", "<C-]>", "<cmd>:res +2<CR>")
vim.keymap.set("n", "<C-[>", "<cmd>:res -2<CR>")
vim.keymap.set("n", "<C-,>", "<cmd>:vertical res -2<CR>")
vim.keymap.set("n", "<C-.>", "<cmd>:vertical res +2<CR>")

-- move lines
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line up
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line down

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gvgv") -- move line down (visual)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gvgv") -- move line up (visual)

vim.keymap.set("n", "<C-/>", ":noh<CR>")

-- LSP
local builtin = require("telescope.builtin")
local telescope = require("telescope")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fp", telescope.extensions.projects.projects, {})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fi", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})

-- NVIMTREE
local nvimtree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", nvimtree.tree.toggle, {})

local function open_tab_silent(node)
  local api = require("nvim-tree.api")
  api.node.open.tab(node)
  vim.cmd.tabprev()

end

vim.keymap.set('n', 'T', open_tab_silent, {})

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

