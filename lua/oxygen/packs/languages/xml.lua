return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'xml')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lemminx = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'lemminx')
    end,
  },
}
