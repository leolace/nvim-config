require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = function(_, _)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
      on_attach = on_attach
    }
    end,
}


