return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'c_sharp' })
    end,
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
