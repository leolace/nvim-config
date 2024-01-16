return {
  "RRethy/vim-illuminate",
  config = function()
    require('illuminate').configure {}
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

    --- auto update the highlight style on colorscheme change
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      pattern = { "*" },
      callback = function(ev)
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#b700ff", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#b700ff", fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#b700ff", fg = "#ffffff" })
      end
    })
  end

}
