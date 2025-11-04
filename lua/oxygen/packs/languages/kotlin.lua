-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'kotlin')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        kotlin_lsp = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'kotlin_lsp')
    end,
  },
}
