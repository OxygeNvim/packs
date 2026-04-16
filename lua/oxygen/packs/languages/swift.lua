return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        swift = {},
      },
    },
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
