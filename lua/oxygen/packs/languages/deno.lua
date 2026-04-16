return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        denols = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'denols')
    end,
  },
}
