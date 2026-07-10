return {
  "MagicDuck/grug-far.nvim",
  cmd = { "GrugFar" },
  keys = {
    { "<leader>sr", "<cmd>GrugFar<cr>", desc = "Search & Replace" },
    { "<leader>sR", "<cmd>GrugFar prefills={paths=vim.fn.expand('%')}<cr>", desc = "Search & Replace (current file)" },
    { "<leader>sR", mode = "v", "<cmd>GrugFar prefills={selection=true}<cr>", desc = "Search & Replace (selection)" },
  },
  opts = {
    windowCreationCommand = "botright vsplit",
    keymaps = {
      replace = { n = "<leader>r" },
      qflist = { n = "<leader>q" },
      syncLocations = { n = "<leader>s" },
      syncLine = { n = "<leader>l" },
      close = { n = "q" },
      historyOpen = { n = "<leader>h" },
      historyAdd = { n = "<leader>a" },
      refresh = { n = "<leader>f" },
      gotoLocation = { n = "<cr>" },
      pickHistoryEntry = { n = "<cr>" },
    },
  },
}