return {
  { import = 'oxygen.packs.formatters.prettier' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'yaml' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'b0o/SchemaStore.nvim' },
    },
    opts = {
      servers = {
        yamlls = {
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            table.extend(new_config.settings.yaml.schemas, require('schemastore').yaml.schemas())
          end,
          settings = {
            redhat = { telemetry = { enabled = false } },
            yaml = {
              validate = true,
              keyOrdering = false,
              format = {
                enable = true,
              },
              schemaStore = {
                enable = false,
                url = '',
              },
            },
          },
        },
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'yamlls')
    end,
  },
}
