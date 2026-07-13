return {
  "stevearc/dressing.nvim",
  opts = {},
  config = function(_, opts)
    require("dressing").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "DressingInput",
      desc = "Shift+Enter inserts a newline in dressing inputs",
      callback = function()
        vim.keymap.set("i", "<S-CR>", function()
          local row, col = unpack(vim.api.nvim_win_get_cursor(0))
          vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "" })
          vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
        end, { buffer = true, desc = "Insert newline (Shift+Enter)" })
      end,
    })
  end,
}
