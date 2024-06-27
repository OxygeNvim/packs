return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'markdown', 'markdown_inline' })
    end,
  },
}
