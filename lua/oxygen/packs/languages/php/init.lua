return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'php', 'phpdoc' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        phpactor = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'phpactor')
    end,
  },
}
