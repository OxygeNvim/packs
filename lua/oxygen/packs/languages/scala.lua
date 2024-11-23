return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'scala')
    end,
  },

  {
    'mfussenegger/nvim-dap',
    opts = function()
      vim.api.nvim_create_autocmd({ 'LspAttach' }, {
        group = require('oxygen.core.utils').create_augroup('_scala_OnLspAttach'),
        callback = function()
          local dap = require('dap')

          dap.configurations.scala = {
            {
              type = 'scala',
              request = 'launch',
              name = 'Debug',
              metals = {
                runType = 'runOrTestFile',
              },
            },
            {
              type = 'scala',
              request = 'launch',
              name = 'Test target',
              metals = {
                runType = 'testTarget',
              },
            },
          }
        end,
      })
    end,
  },

  {
    'scalameta/nvim-metals',
    ft = { 'scala', 'sbt' },
    dependencies = {
      { "plenary.nvim" },
    },
    opts = function()
      return table.merge(require('metals').bare_config(), require('oxygen.plugins.lsp.defaults'))
    end,
    config = function(_, opts)
      require('metals').initialize_or_attach(opts)
    end,
  },
}
