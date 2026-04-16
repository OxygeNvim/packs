-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        python = {},
      },
    },
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
