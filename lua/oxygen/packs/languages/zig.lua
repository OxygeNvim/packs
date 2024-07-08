return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'zig' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        zls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'zls')
    end,
  },
}
