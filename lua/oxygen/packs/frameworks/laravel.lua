vim.filetype.add({
  pattern = {
    ['.*.blade.php'] = 'blade',
  },
})

return {
  {
    'neovim/nvim-lspconfig',
    opts = function()
      local configs = require('lspconfig.configs')

      configs.blade = {
        default_config = {
          cmd = { 'laravel-dev-generators', 'lsp' },
          filetypes = { 'blade' },
          settings = {},
          root_dir = function(fname)
            return require('lspconfig').util.find_git_ancestor(fname)
          end,
        },
      }

      if vim.fn.executable('laravel-dev-generators') == 1 then
        return {
          servers = {
            blade = {},
          },
        }
      else
        return {}
      end
    end,
  },

  -- BUG: not working or I'm dumb
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = 'https://github.com/EmranMR/tree-sitter-blade',
          files = { 'src/parser.c' },
          branch = 'main',
        },
        filetype = 'blade',
      }

      table.insert(opts.ensure_installed, 'blade')
    end,
  },
}
