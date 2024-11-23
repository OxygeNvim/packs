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
    ft = { 'cmake', "c", "cpp" },
    opts = {
      cmake_executor = {
        name = "overseer",
        opts = {}
      }
    },
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
