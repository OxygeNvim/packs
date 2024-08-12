-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'javascript')
      table.insert(opts.ensure_installed, 'typescript')
      table.insert(opts.ensure_installed, 'jsdoc')
      table.insert(opts.ensure_installed, 'tsx')
    end,
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
    'jose-elias-alvarez/typescript.nvim',
    main = 'typescript',
    ft = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
    opts = function()
      return {
        server = table.merge(require('oxygen.plugins.lsp.defaults'), {
          settings = {
            javascript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            typescript = {
              inlayHints = {
                includeInlayEnumMemberValueHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
        }),
      }
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'tsserver')
    end,
  },
}
