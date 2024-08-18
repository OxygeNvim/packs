return {
  {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.sources, require('null-ls').builtins.formatting.blade_formatter)
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'blade_formatter')
    end,
  },
}