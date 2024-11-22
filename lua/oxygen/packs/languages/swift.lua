return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'swift')
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        sourcekit = {},
      },
    },
  },
}
