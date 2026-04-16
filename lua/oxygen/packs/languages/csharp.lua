return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        c_sharp = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        csharp_ls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'csharp_ls')
    end,
  },
}
