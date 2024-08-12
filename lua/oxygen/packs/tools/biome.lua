return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        biome = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'biome')
    end,
  },
}
