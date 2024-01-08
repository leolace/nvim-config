return {
     'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim', "ahmedkhalf/project.nvim" },
    config = function()
      require("telescope").setup {
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      }
      require("telescope").load_extension("projects")
    end
}
