return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local catppuccin = {
      normal = {
        a = { bg = "#89b4fa", fg = "#1e1e2e", bold = true },
        b = { bg = "#313244", fg = "#cdd6f4" },
        c = { bg = "#1e1e2e", fg = "#cdd6f4" },
      },
      insert = {
        a = { bg = "#a6e3a1", fg = "#1e1e2e", bold = true },
      },
      visual = {
        a = { bg = "#cba6f7", fg = "#1e1e2e", bold = true },
      },
      replace = {
        a = { bg = "#f38ba8", fg = "#1e1e2e", bold = true },
      },
      command = {
        a = { bg = "#f9e2af", fg = "#1e1e2e", bold = true },
      },
      inactive = {
        a = { bg = "#313244", fg = "#6c7086" },
        b = { bg = "#1e1e2e", fg = "#6c7086" },
        c = { bg = "#1e1e2e", fg = "#6c7086" },
      },
    }
    require("lualine").setup({
      options = {
        theme = catppuccin,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
