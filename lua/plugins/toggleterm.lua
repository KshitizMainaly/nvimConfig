return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      float_opts = {
        border = "rounded",
      },
    })
    -- Toggle terminal with a clean keybinding
    local map = vim.keymap.set
    map("n", "<leader>T", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal (bottom)" })
  end,
}
