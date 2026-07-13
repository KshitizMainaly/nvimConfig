return {
  "stevearc/dressing.nvim",
  opts = {},
  config = function(_, opts)
    require("dressing").setup(opts)

    local function insert_newline()
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "" })
      vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "DressingInput", "AvanteInput" },
      desc = "Ctrl+j inserts a newline in input buffers",
      callback = function()
        vim.keymap.set("i", "<C-j>", insert_newline, { buffer = true, desc = "Insert newline (Ctrl+J)" })
      end,
    })
  end,
}
