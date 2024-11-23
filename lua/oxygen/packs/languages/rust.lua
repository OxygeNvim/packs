-- TODO: add dap

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'rust')
    end,
  },

  {
    'saecki/crates.nvim',
    main = "crates",
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
        on_attach = function(client, bufnr)
          require('oxygen.plugins.lsp.defaults').on_attach(client, bufnr)
        end,
      },
      popup = {
        border = config.ui.border,
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        rust_analyzer = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'rust_analyzer')
    end,
  },
}
