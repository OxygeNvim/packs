return {
  { import = 'oxygen.packs.languages.toml' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'rust' })
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
          on_attach = function(client, bufnr)
            defaults.on_attach(client, bufnr)

            require('rust-tools').inlay_hints.enable()
          end,
        }),
        tools = {
          inlay_hints = {
            parameter_hints_prefix = '<- ',
            other_hints_prefix = '-> ',
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
