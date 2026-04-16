return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        html = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        html = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'html')
    end,
  },
}
