return {
  { import = 'oxygen.packs.languages.json' },

  { import = 'oxygen.packs.formatters.prettier' },
  { import = 'oxygen.packs.linters.eslint' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'javascript', 'typescript', 'jsdoc', 'tsx' })
    end,
  },

  {
    'jose-elias-alvarez/typescript.nvim',
    ft = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
    opts = function()
      local defaults = require('oxygen.plugins.lsp.defaults')

      return {
        server = table.merge(defaults, {
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
          on_attach = function(client, bufnr)
            defaults.on_attach(client, bufnr)

            -- TODO: add DAP
          end,
        }),
      }
    end,
    config = function(_, opts)
      local typescript = require('typescript')

      typescript.setup(opts)
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'tsserver')
    end,
  },
}
