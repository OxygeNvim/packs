local lspconfig_util = require('lspconfig.util')

return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        denols = {
          root_dir = lspconfig_util.root_pattern('deno.json'),
        },
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'denols')
    end,
  },
}
