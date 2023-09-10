return {
  { import = 'oxygen.packs.languages.cmake' },
  { import = 'oxygen.packs.languages.make' },

  { import = 'oxygen.packs.formatters.clang-format' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'c', 'cpp' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        clangd = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'clangd')
    end,
  },
}
