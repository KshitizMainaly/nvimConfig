return {
  "karb94/neoscroll.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("neoscroll").setup({
      cursor_scrolls_alone = true,
      easing_function = "sine",
      hide_cursor = true,
      stop_eof = true,
      use_local_scrolloff = false,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    })
  end,
}
