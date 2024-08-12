return {
  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      local packages = {
        'clangd',
        'csharp_ls',
        'lua_ls',
        'rust_analyzer',
        'zls',
      }

      for _, package in pairs(packages) do
        opts = table.remove_by_value(opts.ensure_installed, package)
      end

      return opts
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    opts = function(_, opts)
      local packages = { 'stylua', 'clang-format' }

      for _, package in pairs(packages) do
        opts = table.remove_by_value(opts.ensure_installed, package)
      end

      return opts
    end,
  },
}
