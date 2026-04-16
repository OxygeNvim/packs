-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').install({ 'python' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        ruff = {},
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
