return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  -- Lazy-load: the :Telescope command triggers loading, so every
  -- `<cmd>Telescope ...<cr>` mapping in core/keymaps.lua (e.g. <leader>bb,
  -- <leader>gs) still works. The primary finder keys below are declared here
  -- so pressing them loads the plugin too (moved out of keymaps.lua to avoid
  -- defining them in two places).
  cmd = "Telescope",
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  },
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
