vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

return {
  {
    'https://github.com/onecentlin/laravel-blade-snippets-vscode',
    ft = { 'blade' },
  },

  {
    'https://github.com/adalessa/laravel.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-dotenv',
      'MunifTanjim/nui.nvim',
      'nvimtools/none-ls.nvim',
    },
    cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
    ft = { 'blade', 'php' },
    keys = {
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
    },
    config = function()
      local laravel = require('laravel')

      laravel.setup()

      require('telescope').load_extension('laravel')
    end,
  },

  -- TODO: add treesitter parser when `https://github.com/EmranMR/tree-sitter-blade` is available
}
