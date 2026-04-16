local util = require('lspconfig.util')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').install({ 'swift' })
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
