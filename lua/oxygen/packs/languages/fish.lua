return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').install({ 'fish' })
    end,
  },
}
