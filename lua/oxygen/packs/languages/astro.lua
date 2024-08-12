return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'astro')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        astro = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'astro')
    end,
  },
}
