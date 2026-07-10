return {
  "echasnovski/mini.indentscope",
  version = "*",
  event = "VeryLazy",
  opts = {
    symbol = "│",
    options = {
      try_as_border = true,
      indent_at_cursor = true,
      show_floating = false,
    },
    draw = {
      delay = 100,
      animation = require("mini.indentscope").gen_animation.quartic({ easing = "out", duration = 150, unit = "total" }),
      priority = 2,
    },
    mappings = {
      object_scope = "ii",
      object_scope_with_border = "ai",
      goto_top = "[i",
      goto_bottom = "]i",
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "TelescopePrompt",
        "noice",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    require("mini.indentscope").setup(opts)
  end,
}