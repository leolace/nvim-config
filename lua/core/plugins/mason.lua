return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "jose-elias-alvarez/null-ls.nvim"
  },
  opts = {
    ensure_installed = {
      "rust_analyser"
    }
  },
  config = function()
    require("mason").setup {}

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end
}
