return {
  "gelguy/wilder.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })
    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({ fuzzy = 1, fuzzy_filter = wilder.vim_fuzzy_filter() }),
        wilder.search_pipeline()
      ),
    })
    wilder.set_option("renderer", wilder.renderer_mux({
      [":"] = wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        border = "rounded",
      }),
      ["/"] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        separator = " | ",
      }),
    }))
  end,
}
