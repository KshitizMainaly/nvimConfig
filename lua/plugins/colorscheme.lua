-- Catppuccin flavour — change the value of `flavour` below to switch themes:
--   "latte"     -- Light (white background)
--   "frappe"    -- Medium dark
--   "macchiato" -- Darker
--   "mocha"     -- Darkest (default)
local flavour = "latte"

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = flavour,
      transparent_background = false,
      term_colors = true,
      -- Compile highlight groups to disk so startup is faster after first run.
      compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
      },
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
