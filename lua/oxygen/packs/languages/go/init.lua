return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'go', 'gomod', 'gosum' })
    end,
  },

  {
    'ray-x/go.nvim',
    ft = { 'go', 'gomod' },
    dependencies = {
      'ray-x/guihua.lua',
    },
    opts = function()
      return {
        lsp_cfg = require('oxygen.plugins.lsp.defaults'),
        inlay_hints = {
          parameter_hints_prefix = '<- ',
          other_hints_prefix = '-> ',
        },
        luasnip = true,
      }
    end,
    config = function(_, opts)
      require('go').setup(opts)

      local format_sync_group = vim.api.nvim_create_augroup('GoImport', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').goimport()
        end,
        group = format_sync_group,
      })
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'gopls')
    end,
  },
}
