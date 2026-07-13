return {
  "karb94/neoscroll.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("neoscroll").setup({
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = "sine",
    })
  end,
}
