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
    opts = function()
      local defaults = require('oxygen.plugins.lsp.defaults')

      return table.merge(defaults, {
        cmd = { 'jdtls' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'pom.xml' }, { upward = true })[1]),
        on_attach = function(client, bufnr)
          defaults.on_attach(client, bufnr)

          require('jdtls.setup').add_commands()
        end,
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
