local plugins = {
  {"catppuccin/nvim", name = "catppuccin"},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "tsx" },
        highlight = { enable = true },
        indent = { enable = true },  
      })
  end
  },
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"neovim/nvim-lspconfig"},
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'akinsho/toggleterm.nvim', 
    version = "*", 
    config = function() 
      require("toggleterm").setup{
        direction = "float"
      }
    end
  },
  {
    "tanvirtin/vgit.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function() 
      require('vgit').setup {}
    end
  },
  {
		"ms-jpq/coq_nvim",
    dependencies = {
      "ms-jpq/coq.artifact"
    },
    config = function()
       vim.cmd("COQnow") 

      vim.g.coq_settings = {["keymap.jump_to_mark"] = ""}
    end
  },
  {
    "yazeed1s/minimal.nvim"
  },
  {
    "romgrk/barbar.nvim"
  }
}

require("lazy").setup(plugins, {})

