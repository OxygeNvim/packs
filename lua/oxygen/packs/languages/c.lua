return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'c')
      table.insert(opts.ensure_installed, 'cpp')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        clangd = {
          cmd = {
            'clangd',
            '--clang-tidy',
          },
        },
      },
    },
  },

  {
    'mfussenegger/nvim-dap',
    opts = function()
      local dap = require('dap')

      if not dap.adapters['codelldb'] then
        dap.adapters['codelldb'] = {
          type = 'server',
          port = '${port}',
          executable = {
            command = 'codelldb',
            args = {
              '--port',
              '${port}',
            },
          },
        }
      end

      for _, lang in pairs({ 'c', 'cpp' }) do
        dap.configurations[lang] = {
          {
            type = 'codelldb',
            request = 'launch',
            name = 'Debug',
            cwd = '${workspaceFolder}',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
          },
          {
            type = 'codelldb',
            request = 'attach',
            name = 'Debug process',
            cwd = '${workspaceFolder}',
            pid = require('dap.utils').pick_process,
          },
        }
      end
    end,
  },

  {
    url = 'https://git.sr.ht/~p00f/clangd_extensions.nvim',
    main = 'clangd_extensions',
    ft = { 'c', 'cpp' },
    opts = function()
      return {
        inlay_hints = {
          inline = false,
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
          kind_icons = require('oxygen.ui.icons').kind_icons,
        },
        memory_usage = {
          border = config.ui.border,
        },
        symbol_info = {
          border = config.ui.border,
        },
      }
    end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'codelldb')
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'clangd')
    end,
  },
}
