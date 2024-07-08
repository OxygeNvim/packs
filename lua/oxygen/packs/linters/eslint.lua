return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    opts = function(_, opts)
      local null_ls = require('null-ls')

      local has_eslint_config = function(u)
        return u.root_has_file('.eslintrc') or u.root_has_file('.eslintrc.json') or u.root_has_file('.eslintrc.js')
      end

      table.insert(
        opts.sources,
        null_ls.builtins.diagnostics.eslint_d.with({
          condition = has_eslint_config,
        })
      )
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'eslint_d')
    end,
  },
}
