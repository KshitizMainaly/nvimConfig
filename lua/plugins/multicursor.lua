return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  -- Lazy-load on the keys that create cursors. mc.setup() and the <Esc> layer
  -- run in config() the first time one of these is pressed.
  keys = {
    { "<C-n>", function() require("multicursor-nvim").matchAddCursor(1) end, mode = { "n", "x" }, desc = "Multicursor: add cursor on next match" },
    { "<C-Up>", function() require("multicursor-nvim").lineAddCursor(-1) end, mode = { "n", "x" }, desc = "Multicursor: add column cursor up" },
    { "<C-Down>", function() require("multicursor-nvim").lineAddCursor(1) end, mode = { "n", "x" }, desc = "Multicursor: add column cursor down" },
    { "<leader>A", function() require("multicursor-nvim").matchAllAddCursors() end, mode = { "n", "x" }, desc = "Multicursor: add cursors to all matches" },
  },
  config = function()
    local mc = require("multicursor-nvim")
    -- setup() has no treesitter/undo flags per the README; undo/redo works out
    -- of the box and treesitter compatibility is handled internally.
    mc.setup()

    -- Mappings defined in a keymap layer only apply while multiple cursors
    -- exist, so <Esc> here won't shadow the normal <Esc> otherwise.
    mc.addKeymapLayer(function(layerSet)
      -- Clear extra cursors (re-enable first if they were toggled off).
      layerSet("n", "<Esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Cursor appearance.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
