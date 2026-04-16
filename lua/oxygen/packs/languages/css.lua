return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        css = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        cssls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'cssls')
    end,
  },
}
