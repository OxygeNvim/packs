return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').install({
        'gitignore',
        'gitcommit',
        'gitattributes',
        'git_rebase',
        'git_config',
      })
    end,
  },
}
