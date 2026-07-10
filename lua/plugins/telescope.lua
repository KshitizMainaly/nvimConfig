return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "target" },
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        preview = {
          treesitter = false,
        },
      },
    })
    telescope.load_extension("fzf")
  end,
}
