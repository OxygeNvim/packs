return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').install({ 'bash' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        bashls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'bashls')
    end,
  },
}
