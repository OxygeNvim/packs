return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'dart')
    end,
  },

  {
    'akinsho/flutter-tools.nvim',
    main = 'flutter-tools',
    ft = { 'dart' },
    opts = function()
      return {
        ui = {
          border = config.ui.border,
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          register_configurations = function()
            require('dap').configurations.dart = {
              {
                name = 'Debug',
                type = 'dart',
                request = 'launch',
                program = function()
                  return vim.fn.input('Path to file: ', vim.fn.getcwd() .. "/", 'file')
                end,
              },
            }
          end,
        },
        lsp = require('oxygen.plugins.lsp.defaults'),
      }
    end,
    specs = {
      {
        'telescope.nvim',
        opts = function()
          require('telescope').load_extension('flutter')
        end,
      },
    },
  },
}
