return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'graphql')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        graphql = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'graphql')
    end,
  },
}
