return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        eslint = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'eslint')
    end,
  },
}
