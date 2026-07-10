return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  config = function()
    require("neogit").setup({
      kind = "split",
      integrations = {
        diffview = true,
      },
    })
  end,
}
