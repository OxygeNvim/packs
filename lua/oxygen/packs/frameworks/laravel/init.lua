vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

return {
  { import = 'oxygen.packs.languages.php' },

  { import = 'oxygen.packs.formatters.blade-formatter' },

  {
    'https://github.com/onecentlin/laravel-blade-snippets-vscode',
    ft = { 'blade' },
  },

  -- {
  --   'https://github.com/adalessa/laravel.nvim',
  --   dependencies = {
  --     'nvim-telescope/telescope.nvim',
  --     'tpope/vim-dotenv',
  --     'MunifTanjim/nui.nvim',
  --   },
  --   cmd = { 'Sail', 'Artisan', 'Composer', 'Npm', 'Yarn', 'Laravel' },
  --   ft = { 'blade', 'php' },
  --   init = function()
  --     local keymaps = require('oxygen.core.keymaps')
  --
  --     keymaps['laravel.nvim'] = {
  --       n = {
  --         ['<leader>la'] = { ':Artisan<CR>', 'Laravel Artisan commands' },
  --         ['<leader>lr'] = { ':Laravel routes<CR>', 'Laravel routes' },
  --       },
  --       v = {
  --         ['<leader>lt>'] = {
  --           function()
  --             require('laravel.tinker').send_to_tinker()
  --           end,
  --           'Laravel application routes',
  --         },
  --       },
  --     }
  --
  --     utils.load_keymap('laravel.nvim')
  --   end,
  --   config = function()
  --     local laravel = require('laravel')
  --
  --     laravel.setup()
  --     require('telescope').load_extension('laravel')
  --   end,
  -- },

  -- TODO: add treesitter parser when `https://github.com/EmranMR/tree-sitter-blade` is available
}
