vim.cmd.colorscheme "moonfly"
vim.cmd("set noshowmode")
vim.cmd("set scrolloff=8")
vim.cmd("set foldmethod=indent")
vim.cmd("set foldlevelstart=10")
vim.loader.enable()
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_set_hl(0, "Visual", { bg = "#ffffff", fg = "#000000" })

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.bo.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true

vim.opt.termguicolors = true

vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = ""
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = false

vim.opt.cmdheight = 0
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

vim.opt.preserveindent = true
vim.opt.breakindent = true
vim.opt.copyindent = true

vim.cmd("set updatetime=700")

vim.diagnostic.config({ virtual_text = false })

