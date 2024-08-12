local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'lua')
      table.insert(opts.ensure_installed, 'luap')
      table.insert(opts.ensure_installed, 'luau')
      table.insert(opts.ensure_installed, 'luadoc')
    end,
  },

  {
    'folke/lazydev.nvim',
    main = 'lazydev',
    ft = { 'lua' },
    cmd = { 'LazyDev' },
    dependencies = {
      { 'Bilal2453/luvit-meta' },
    },
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
    specs = {
      {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
          table.insert(opts.sources, {
            name = 'lazydev',
            group_index = 0,
          })
        end,
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
                path = runtime_path,
              },
              diagnostics = {
                globals = { 'vim', 'config', 'table' },
                redefinedLocal = false,
              },
              workspace = {
                library = {
                  vim.fn.expand('$VIMRUNTIME/lua'),
                  vim.fn.expand('$VIMRUNTIME/lua/vim/lsp'),
                  vim.fn.stdpath('config') .. '/lua',
                },
                maxPreload = 10000,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, 'lua_ls')
    end,
  },
}
