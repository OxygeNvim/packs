return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'go', 'gomod', 'gosum' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'gopls')
    end,
  },
}
