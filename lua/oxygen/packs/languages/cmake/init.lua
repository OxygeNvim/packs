return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'cmake' })
    end,
  },

  {
    'Civitasv/cmake-tools.nvim',
    ft = { 'cmake' },
    opts = {},
    config = function(_, opts)
      local cmake_tools = require('cmake-tools')

      cmake_tools.setup(opts)
    end,
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
