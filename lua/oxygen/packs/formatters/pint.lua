return {
  {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.sources, require('null-ls').builtins.formatting.pint)
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'pint')
    end,
  },
}
