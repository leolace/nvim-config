---@diagnostic disable: undefined-global
-- TODO: give a desc to all keymaps

-- GENERAL
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<C-u>", ":source %<CR>")

vim.keymap.set("n", "<ESC>", function() end)

-- change cursor navigatioe keymaps to qwerty keyboard
vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "l", "k")
vim.keymap.set("n", "ç", "l")

vim.keymap.set("v", "l", "k") -- visual up
vim.keymap.set("v", "k", "j") -- visual down
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "ç", "l")

-- switch between windows
vim.keymap.set("n", "<C-k>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-ç>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd k<CR>", { silent = true })

-- terminal mode
vim.keymap.set("t", "<Esc>", "<cmd>:q<CR>")

-- exit to normal mode
vim.keymap.set("i", "<A-j>", "<Esc>")
vim.keymap.set("v", "<A-j>", "<Esc>")

-- resize window
vim.keymap.set("n", "<C-]>", "<cmd>:res +2<CR>")
vim.keymap.set("n", "<C-[>", "<cmd>:res -2<CR>")
vim.keymap.set("n", "<C-,>", "<cmd>:vertical res -2<CR>")
vim.keymap.set("n", "<C-.>", "<cmd>:vertical res +2<CR>")

-- move lines
vim.keymap.set("n", "<A-k>", ":m .+1<CR>==") -- move line down
vim.keymap.set("n", "<A-l>", ":m .-2<CR>==") -- move line up

vim.keymap.set("n", "<A-h>", function() end)

-- vim.keymap.set("n", "D", function()end)

vim.keymap.set("v", "<A-k>", ":m '>+1<CR>gvgv") -- move line down (visual)
vim.keymap.set("v", "<A-l>", ":m '<-2<CR>gvgv") -- move line up (visual)

vim.keymap.set("n", "<C-/>", ":noh<CR>")

-- TROUBLE
local trouble = function(mode)
  if mode then
    require("trouble").toggle(mode)
  else
    require("trouble").toggle()
  end
end

vim.keymap.set("n", "<leader>xx", trouble)
vim.keymap.set("n", "<leader>xw", function() trouble("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- LSP
vim.keymap.set("n", "D", vim.diagnostic.open_float, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set('n', 'F', vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})


local builtin = require("telescope.builtin")
local telescope = require("telescope")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fp", telescope.extensions.projects.projects, {})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fi", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "select a coloscheme" })
vim.keymap.set("n", "<leader>fd", builtin.lsp_document_symbols, {})


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

vim.keymap.set('n', 'Ç', '<Cmd>BufferNext<CR>', opts)
vim.keymap.set('n', 'J', '<Cmd>BufferPrevious<CR>', opts)

-- Re-order to previous/next
vim.keymap.set('n', '<A-J>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A-Ç>', '<Cmd>BufferMoveNext<CR>', opts)

-- close buffer
vim.keymap.set('n', '<S-c>', '<Cmd>BufferClose<CR>', opts)
