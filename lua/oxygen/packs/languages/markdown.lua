return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'markdown')
      table.insert(opts.ensure_installed, 'markdown_inline')
    end,
  },
}
