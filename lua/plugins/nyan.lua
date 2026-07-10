return {
  "Willothy/nyan.nvim",
  event = "VeryLazy",
  config = function()
    require("nyan").setup({
      theme = "catppuccin-mocha",
      separator = " | ",
      position = { row = 0, col = 0 },
      max_width = 50,
      min_width = 20,
      speed = 30,
      nyan = {
        "🐱",
        "🐱",
        "🐱",
        "🐱",
        "🐱",
      },
      colors = {
        bg = "#1e1e2e",
        fg = "#cdd6f4",
        accent = "#f5c2e7",
      },
      time = {
        show = true,
        format = "%H:%M",
      },
      git = {
        show = true,
        ahead = "↑",
        behind = "↓",
        dirty = "●",
      },
      diagnostics = {
        show = true,
        error = "✗",
        warn = "!",
        info = "i",
        hint = "?",
      },
      lsp = {
        show = true,
        progress = true,
      },
    })
  end,
}