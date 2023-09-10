return {
  { import = 'oxygen.packs.formatters.prettier' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'json', 'jsonc', 'json5' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'b0o/SchemaStore.nvim' },
    },
    opts = {
      servers = {
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            table.extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'jsonls')
    end,
  },
}
