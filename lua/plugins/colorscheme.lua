return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        telescope = { enabled = true },
        neo_tree = true,
        which_key = true,
        indent_blankline = { enabled = true },
        mini = { enabled = true },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
