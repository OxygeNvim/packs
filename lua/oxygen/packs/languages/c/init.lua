return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'c', 'cpp' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        clangd = {},
      },
    },
  },

  {
    url = 'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    ft = { 'c', 'cpp' },
    opts = function()
      return {
        ast = {
          role_icons = {
            type = '',
            declaration = '',
            expression = '',
            specifier = '',
            statement = '',
            ['template argument'] = '',
          },
          kind_icons = require('oxygen.ui.modules.icons').kind_icons,
        },
        memory_usage = {
          border = config.ui.border,
        },
        symbol_info = {
          border = config.ui.border,
        },
      }
    end,
    config = function(_, opts)
      require('clangd_extensions').setup(opts)
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'clangd')
    end,
  },
}
