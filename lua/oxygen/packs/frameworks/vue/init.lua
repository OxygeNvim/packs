return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'vue' })
    end,
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
