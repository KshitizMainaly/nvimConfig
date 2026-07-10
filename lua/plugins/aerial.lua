return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  cmd = { "AerialToggle", "AerialNavToggle" },
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Aerial: Symbol Outline" },
    { "<leader>O", "<cmd>AerialNavToggle<cr>", desc = "Aerial: Nav Window" },
  },
  opts = {
    backends = { "lsp", "treesitter", "markdown", "man" },
    layout = {
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 30,
      default_direction = "prefer_right",
      placement = "window",
      preserve_equality = false,
    },
    attach_mode = "global",
    show_guides = true,
    guides = {
      mid_item = "├─",
      last_item = "└─",
      nested_top = "│ ",
      whitespace = "  ",
    },
    filter_kind = {
      "Class", "Constructor", "Enum", "Function", "Interface",
      "Module", "Method", "Struct", "Property", "Variable",
    },
  },
}