return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      delay = 100,
      plugins = {
        spelling = { enabled = false },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
        },
      },
      hidden = { "v", "V", "<C-v>" },
    })
    wk.add({
      { "<leader>e", desc = "File Explorer" },
      { "<leader>f", desc = "Find Files" },
      { "<leader>g", group = "Git" },
      { "<leader>gg", desc = "Neogit Status" },
      { "<leader>gd", desc = "Diff View" },
      { "<leader>gh", desc = "Git History" },
      { "<leader>gs", desc = "Live Grep" },
      { "<leader>b", desc = "Buffers" },
      { "<leader>s", desc = "Git Status" },
      { "<leader>w", desc = "Save" },
      { "<leader>q", desc = "Quit" },
      { "<leader>h", desc = "No Highlight" },
      { "<leader>x", desc = "Close Buffer" },
      { "<leader>r", group = "Rename" },
      { "<leader>c", group = "Code" },
      { "<leader>d", group = "Document" },
      { "<leader>p", group = "Preview" },
      { "[", group = "Previous" },
      { "]", group = "Next" },
    })
  end,
}
