return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        main = 'copilot_cmp',
        dependencies = {
          {
            'zbirenbaum/copilot.lua',
            main = 'copilot',
            cmd = { 'Copilot' },
            opts = {
              suggestion = { enabled = false },
              panel = { enabled = false },
            },
          },
        },
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require('copilot_cmp')
          copilot_cmp.setup(opts)

          vim.api.nvim_create_autocmd('LspAttach', {
            group = require('oxygen.core.utils').create_augroup('_copilot_OnLspAttach'),
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)

              if client.name == 'copilot' then
                copilot_cmp._on_insert_enter({})
              end
            end,
          })
        end,
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = 'copilot', keyword_length = 2, priority = 1750 })
    end,
  },
}
