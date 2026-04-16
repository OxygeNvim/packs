return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        bash = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        bashls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'bashls')
    end,
  },
}
