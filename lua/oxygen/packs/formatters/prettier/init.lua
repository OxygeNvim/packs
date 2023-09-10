return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local null_ls = require('null-ls')

      table.insert(opts.sources, null_ls.builtins.formatting.prettierd)
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'prettierd')
    end,
  },
}
