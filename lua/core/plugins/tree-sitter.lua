return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "tsx", "markdown", "rust" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end

}
