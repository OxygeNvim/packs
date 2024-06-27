return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'dart' })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        dartls = {},
      },
    },
  },
}
