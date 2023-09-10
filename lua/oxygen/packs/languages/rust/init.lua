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
    opts = {
      server = table.merge({}, require('oxygen.plugins.lsp.defaults')),
      tools = {
        inlay_hints = {
          parameter_hints_prefix = '<- ',
          other_hints_prefix = '-> ',
          right_align_padding = 5,
        },
        hover_actions = {
          border = config.ui.border,
        },
      },
    },
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
