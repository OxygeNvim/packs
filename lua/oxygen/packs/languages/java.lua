-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'java')
    end,
  },

  {
    'mfussenegger/nvim-jdtls',
    main = 'jdtls',
    ft = { 'java' },
    opts = function()
      return table.merge(require('oxygen.plugins.lsp.defaults'), {
        cmd = { 'jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
        settings = {
          java = {
            inlayHints = {
              parameterNames = { enabled = 'all' },
            },
          },
        },
        init_options = {
          extendedClientCapabilities = table.merge(require('jdtls').extendedClientCapabilities, {
            onCompletionItemSelectedCommand = 'editor.action.triggerParameterHints',
          }),
        },
      })
    end,
    config = function(_, opts)
      require('jdtls').start_or_attach(opts)
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'jdtls')
    end,
  },
}
