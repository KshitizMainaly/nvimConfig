return {
  "SmiteshP/nvim-navic",
  dependencies = { "neovim/nvim-lspconfig" },
  event = "LspAttach",
  opts = {
    lsp = { auto_attach = true, preference = nil },
    highlight = true,
    separator = "  ",
    depth_limit = 5,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = true,
    click = true,
  },
  config = function(_, opts)
    require("nvim-navic").setup(opts)
    vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
  end,
}