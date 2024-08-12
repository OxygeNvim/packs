return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'php')
      table.insert(opts.ensure_installed, 'phpdoc')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        phpactor = {},
      },
    },
  },

  {
    'mfussenegger/nvim-dap',
    opts = function()
      vim.api.nvim_create_autocmd({ 'LspAttach' }, {
        group = require('oxygen.core.utils').create_augroup('_xdebug_OnLspAttach'),
        callback = function()
          local dap = require('dap')

          if not dap.adapters['xdebug'] then
            dap.adapters['xdebug'] = {
              type = 'executable',
              command = 'php-debug-adapter',
              args = {},
            }
          end

          dap.configurations['php'] = {
            {
              type = 'xdebug',
              request = 'launch',
              name = 'Debug',
              port = 9003,
              cwd = '${fileDirname}',
              program = '${file}',
              runtimeExecutable = 'php',
            },
            {
              type = 'xdebug',
              request = 'launch',
              name = 'Debug file',
              cwd = '${workspaceFolder}',
              port = 9003,
              runtimeExecutable = 'php',
              program = function()
                local file_name = ''

                vim.ui.input({
                  prompt = 'Select file to debug',
                  default = vim.fn.getcwd() .. '/',
                }, function(_file_name)
                  file_name = _file_name
                end)

                return file_name
              end,
            },
          }
        end,
      })
    end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'php-debug-adapter')
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'phpactor')
    end,
  },
}
