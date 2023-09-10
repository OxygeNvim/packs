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
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            table.extend(new_config.settings.yaml.schemas, require('schemastore').yaml.schemas())
          end,
          settings = {
            yaml = {
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
