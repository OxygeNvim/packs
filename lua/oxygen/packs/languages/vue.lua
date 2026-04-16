return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        vue = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        vuels = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'vuels')
    end,
  },
}
