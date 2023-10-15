return {
  { import = 'oxygen.packs.languages.toml' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'rust' })
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      table.insert(opts.sources, { name = 'crates', keyword_length = 2, priority = 1750 })
    end,
  },

  {
    'saecki/crates.nvim',
    event = 'BufRead Cargo.toml',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      null_ls = {
        enabled = true,
        name = 'crates.nvim',
      },
      cmp = {
        enabled = true,
      },
    },
    config = function(_, opts)
      local crates = require('crates')
      local cmp = require('cmp')

      crates.setup(opts)

      cmp.setup.buffer({ sources = { { name = 'crates' } } })
    end,
  },

  {
    'simrat39/rust-tools.nvim',
    ft = { 'rust' },
    opts = function()
      local defaults = require('oxygen.plugins.lsp.defaults')

      return {
        server = table.merge(defaults, {
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = 'clippy',
                extraArgs = { '--no-deps' },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
        }),
        tools = {
          inlay_hints = {
            auto = false,
          },
          hover_actions = {
            border = config.ui.border,
          },
        },
      }
    end,
    config = function(_, opts)
      local rust_tools = require('rust-tools')

      rust_tools.setup(opts)
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'rust_analyzer')
    end,
  },
}
