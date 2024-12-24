return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'swift')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = function()
      local util = require('lspconfig.util')

      return {
        servers = {
          sourcekit = {
            filetypes = { 'swift', 'objc', 'objcpp' },
            root_dir = function(filename, _)
              return util.root_pattern('buildServer.json')(filename)
                  or util.root_pattern('*.xcodeproj', '*.xcworkspace')(filename)
                  or util.root_pattern('Package.swift')(filename)
                  or vim.fs.dirname(vim.fs.find('.git', { path = filename, upward = true })[1])
            end,
          },
        },
      }
    end,
  },
}
