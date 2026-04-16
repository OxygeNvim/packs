-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        zig = {},
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        zls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'zls')
    end,
  },
}
