return {
  { import = 'oxygen.packs.formatters.black' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'python' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        jedi_language_server = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'jedi_language_server')
    end,
  },
}
