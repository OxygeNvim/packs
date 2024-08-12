return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'gitignore')
      table.insert(opts.ensure_installed, 'gitcommit')
      table.insert(opts.ensure_installed, 'gitattributes')
      table.insert(opts.ensure_installed, 'git_rebase')
    end,
  },
}
