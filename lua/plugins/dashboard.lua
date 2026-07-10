return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
          "             [ Neovim v0.12.4 ]",
          "",
        },
        center = {
          { icon = "  ", key = "f", desc = "Find File", action = "Telescope find_files" },
          { icon = "  ", key = "r", desc = "Recent Files", action = "Telescope oldfiles" },
          { icon = "  ", key = "g", desc = "Live Grep", action = "Telescope live_grep" },
          { icon = "  ", key = "e", desc = "New File", action = "enew" },
          { icon = "  ", key = "c", desc = "Configuration", action = "edit $MYVIMRC" },
          { icon = "  ", key = "q", desc = "Quit", action = "qa" },
        },
        footer = function()
          local stats = require("lazy").stats()
          return { "", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins" }
        end,
      },
    })
  end,
}
