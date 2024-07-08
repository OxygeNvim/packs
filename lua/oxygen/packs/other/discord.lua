return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("presence").setup(opts)
    end
  }
}
