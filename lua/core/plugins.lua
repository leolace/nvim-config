local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").load_extension("projects")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "tsx" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 30,
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
      }
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup {
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
      vim.g.coq_settings = { ["keymap.jump_to_mark"] = "" }
    end
  },
  {
    "romgrk/barbar.nvim"
  },
  {
    "tpope/vim-surround"
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require("core.plugins.lualine")
    end
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the desault settings
        -- refer to the configuration section below
      }
    end
  }
}

require("lazy").setup(plugins, {})
