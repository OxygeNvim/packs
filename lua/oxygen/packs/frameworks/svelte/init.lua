return {
  { import = 'oxygen.packs.languages.html' },
  { import = 'oxygen.packs.languages.css' },
  { import = 'oxygen.packs.languages.javascript' },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'svelte' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        svelte = {},
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'svelte')
    end,
  },
}
