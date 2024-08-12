return {
  {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.sources, require('null-ls').builtins.diagnostics.ktlint)
      table.insert(opts.sources, require('null-ls').builtins.formatting.ktlint)
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'ktlint')
    end,
  },
}
