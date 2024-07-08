return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<leader>R",  "",                                         desc = "+Rest" },
      { "<leader>Rs", ":lua require('kulala').run()<CR>",         desc = "Send the request" },
      { "<leader>Rt", ":lua require('kulala').toggle_view()<CR>", desc = "Toggle headers/body" },
      { "<leader>Rp", ":lua require('kulala').jump_prev()<CR>",   desc = "Jump to previous request" },
      { "<leader>Rn", ":lua require('kulala').jump_next()<CR>",   desc = "Jump to next request" },
    },
    opts = function()
      local icons = require("oxygen.ui.modules.icons")

      return {
        icons = {
          inlay = {
            done = icons.tick,
            loading = icons.search
          }
        }
      }
    end,
    config = function(_, opts)
      require("kulala").setup(opts)
    end
  },
}
