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
      disable_hint = true,
      disable_context_highlighting = true,
      filewatcher = { enabled = false },
      integrations = {
        diffview = true,
      },
    })
  end,
}
