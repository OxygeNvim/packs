return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'cmake')
    end,
  },

  {
    'Civitasv/cmake-tools.nvim',
    main = 'cmake-tools',
    ft = { 'cmake' },
    opts = {},
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        cmake = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'cmake')
    end,
  },
}
