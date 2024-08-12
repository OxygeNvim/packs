return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'go')
      table.insert(opts.ensure_installed, 'gomod')
      table.insert(opts.ensure_installed, 'gosum')
      table.insert(opts.ensure_installed, 'gowork')
    end,
  },

  {
    'ray-x/go.nvim',
    main = 'go',
    ft = { 'go', 'gomod' },
    dependencies = {
      { 'ray-x/guihua.lua' },
    },
    opts = function()
      return {
        lsp_cfg = require('oxygen.plugins.lsp.defaults'),
        luasnip = true,
      }
    end,
    config = function(_, opts)
      require('go').setup(opts)

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = require('oxygen.core.utils').create_augroup('GoImport'),
        pattern = '*.go',
        callback = function()
          require('go.format').goimport()
        end,
      })
    end,
  },

  {
    'leoluz/nvim-dap-go',
    main = 'dap-go',
    ft = { 'go' },
    dependencies = {
      { 'nvim-dap' },
    },
    opts = {},
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'delve')
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'gopls')
    end,
  },
}
