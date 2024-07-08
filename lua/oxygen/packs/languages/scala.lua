return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'scala' })
    end,
  },

  {
    'scalameta/nvim-metals',
    ft = { 'scala', 'sbt' },
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    opts = function()
      local metals = require('metals')

      return table.merge(metals.bare_config(), require('oxygen.plugins.lsp.defaults'), {
        on_attach = function(client, bufnr)
          require('oxygen.plugins.lsp.defaults').on_attach(client, bufnr)

          -- TODO: add DAP
        end,
      })
    end,
    config = function(_, opts)
      local metals = require('metals')

      metals.initialize_or_attach(opts)
    end,
  },
}
