return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'java' })
    end,
  },

  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
    opts = table.merge({
      cmd = { 'jdtls' },
      root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
      on_attach = function(client, bufnr)
        require('oxygen.plugins.lsp.defaults').on_attach(client, bufnr)

        require('jdtls.setup').add_commands()
      end,
    }, require('oxygen.plugins.lsp.defaults')),
    config = function(_, opts)
      local jdtls = require('jdtls')

      jdtls.start_or_attach(opts)
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'jdtls')
    end,
  },
}
