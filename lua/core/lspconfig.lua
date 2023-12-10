require("mason").setup()
require("mason-lspconfig").setup()
local coq = require("coq")

local on_attach = function(_, _)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'D', vim.diagnostic.open_float, {})
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'F', vim.lsp.buf.format, {})
end

require("mason-lspconfig").setup_handlers {
  function(server_name) -- default handler (optional)
    coq.lsp_ensure_capabilities()
    require("lspconfig")[server_name].setup {
      on_attach = on_attach
    }
  end,
}
