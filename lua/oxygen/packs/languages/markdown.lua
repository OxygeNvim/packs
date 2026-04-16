return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter').install({ 'markdown', 'markdown_inline' })
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
