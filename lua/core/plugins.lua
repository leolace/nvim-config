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
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "typescript", "tsx", "markdown" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/nvim-cmp" },
  { "dcampos/nvim-snippy" },
  { "dcampos/cmp-snippy" },
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
        direction = "float",
        persist_mode = true,
        autochdir = true,
        start_in_insert = false
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
  -- {
  --   "ms-jpq/coq_nvim",
  --   dependencies = {
  --     "ms-jpq/coq.artifact"
  --   },
  --   config = function()
  --     vim.cmd("COQnow")
  --     vim.g.coq_settings = { ["keymap.jump_to_mark"] = "" }
  --   end
  -- },
  {
    "romgrk/barbar.nvim"
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
    lazy = true,
    config = function()
      require("project_nvim").setup {
        manual_mode = true
      }
    end
  },
  {
    "Raimondi/delimitMate"
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "MunifTanjim/prettier.nvim",
    config = function()
      local prettier = require("prettier")

      prettier.setup {
        bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },
      }
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettierd,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,
        },
      }
    end
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure {
        delay = 300
      }
    end

  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

}

require("lazy").setup(plugins, {})
