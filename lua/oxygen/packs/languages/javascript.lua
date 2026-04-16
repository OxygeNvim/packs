-- TODO: add dap

local lspconfig_util = require('lspconfig.util')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        javascript = {},
        typescript = {},
        jsdoc = {},
        tsx = {},
      },
    },
  },

  {
    'axelvc/template-string.nvim',
    event = { 'InsertEnter' },
    opts = {
      remove_template_string = true,
    },
    config = function(_, opts)
      require('template-string').setup(opts)
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        ts_ls = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'ts_ls')
    end,
  },
}
