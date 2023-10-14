return {
  { import = 'oxygen.packs.languages.cmake' },
  { import = 'oxygen.packs.languages.make' },

  { import = 'oxygen.packs.formatters.clang-format' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'c', 'cpp' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        clangd = {
          on_attach = function()
            local ok_inlay_hints, inlay_hints = r('clangd_extensions.inlay_hints')

            if ok_inlay_hints then
              inlay_hints.setup_autocmd()
              inlay_hints.set_inlay_hints()
            end
          end,
        },
      },
    },
  },

  {
    url = 'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    ft = { 'c', 'cpp' },
    opts = function()
      return {
        inlay_hints = {
          inline = true,
          parameter_hints_prefix = '<- ',
          other_hints_prefix = '-> ',
        },
        ast = {
          role_icons = {
            type = '',
            declaration = '',
            expression = '',
            specifier = '',
            statement = '',
            ['template argument'] = '',
          },
          kind_icons = require('oxygen.ui.modules.icons').kind_icons,
        },
        memory_usage = {
          border = config.ui.border,
        },
        symbol_info = {
          border = config.ui.border,
        },
      }
    end,
    setup = function(_, opts)
      require('clangd_extensions').setup(opts)
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'clangd')
    end,
  },
}
