local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      table.insert(opts.ensure_installed, { 'lua', 'luap', 'luau', 'luadoc' })
    end,
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
                  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                  [vim.fn.stdpath('config') .. '/lua'] = true,
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
