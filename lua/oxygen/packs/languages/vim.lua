return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      parsers = {
        vim = {},
        vimdoc = {},
      },
    },
  },

  {
    'OXY2DEV/helpview.nvim',
    main = 'helpview',
    ft = { 'help' },
    opts = {
      preview = {
        icon_provider = 'devicons',
      },
    },
  },
}
