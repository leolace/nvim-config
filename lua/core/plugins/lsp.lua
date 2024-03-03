return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")

    local on_attach = function(_, _)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'D', vim.diagnostic.open_float, {})
    end

    lspconfig.lua_ls.setup {
      on_attach = on_attach
    }

    lspconfig.rust_analyzer.setup {
      on_attach = on_attach,
      cmd = {"/usr/lib/rustup/bin/rust-analyzer"}
    }
  end

}
