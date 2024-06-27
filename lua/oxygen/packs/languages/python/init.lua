return {
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
        ruff_lsp = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'ruff_lsp')
    end,
  },
}
