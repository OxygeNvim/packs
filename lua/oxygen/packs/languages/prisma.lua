return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        prisma = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        prismals = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'prismals')
    end,
  },
}
