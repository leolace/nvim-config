local kind_icons = {
  Text = "  ",
  Method = "  ",
  Function = " 󰊕 ",
  Constructor = "  ",
  Field = " 󰇽 ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = " 󰌋 ",
  Snippet = "  ",
  Color = "  ",
  File = " 󰈙 ",
  Reference = "  ",
  Folder = " 󰉋 ",
  EnumMember = "  ",
  Constant = " 󰏿 ",
  Struct = "  ",
  Event = "  ",
  Operator = " 󰆕 ",
  TypeParameter = " 󰅲 ",
}

return {
  "hrsh7th/cmp-nvim-lsp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup {
      snippet = {
        expand = function(args)
          require('snippy').expand_snippet(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<TAB>"] = cmp.mapping.select_next_item(),
        ["<S-TAB>"] = cmp.mapping.select_prev_item()
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' },
      }, {
        { name = 'buffer' },
      }),
      window = {
        completion = {
          side_padding = 0,
        }
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            cmp_tabnine = "[T9]",
            nvim_lua = "[NVIM_LUA]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      completion = {
        autocomplete = false
      }
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')["tsserver"].setup {
      capabilities = capabilities
    }
    require('lspconfig')["lua_ls"].setup {
      capabilities = capabilities
    }
    require('lspconfig')["cssls"].setup {
      capabilities = capabilities
    }
    require('lspconfig')["svelte"].setup {
      capabilities = capabilities
    }
  end
}
