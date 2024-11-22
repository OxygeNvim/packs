return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'markdown')
      table.insert(opts.ensure_installed, 'markdown_inline')
    end,
  },

  {
    'OXY2DEV/markview.nvim',
    main = 'markview',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      html = {
        enable = true,
        tags = {
          enable = true,
        },
      },
      entities = {
        enable = true,
      },
    },
  },

  {
    'jmbuhr/otter.nvim',
    main = 'otter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
}
