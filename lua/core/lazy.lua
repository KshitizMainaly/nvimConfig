local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = true }, -- plugins are lazy unless they explicitly opt in
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = false },
  change_detection = { notify = false },
  rocks = { hererocks = false, enabled = false },
  ui = { border = "rounded" },
  performance = {
    rtp = {
      -- Disable built-in runtime plugins that this config replaces or does not use.
      -- This noticeably reduces startup time on Windows.
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "zipPlugin",
        "netrw",
        "netrwPlugin",
        "matchit",
        "matchparen",
        "tutor_mode_plugin",
      },
    },
  },
})
