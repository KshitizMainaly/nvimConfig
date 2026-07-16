-- Enable the Lua module cache as early as possible; this speeds up all
-- subsequent `require()` calls (plugins, configs, etc.).
vim.loader.enable()

-- Disable unused built-in Vim runtime plugins before they get sourced.
-- These are replaced by Lua plugins (neo-tree instead of netrw, etc.).
local disabled_builtins = {
  "gzip",
  "tar",
  "tarPlugin",
  "zip",
  "zipPlugin",
  "netrw",
  "netrwPlugin",
  "matchit",
  "matchparen",
  "tutor_mode_plugin",
}
for _, plugin in ipairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 1
end

-- Disable optional external providers we don't use (removes health warnings
-- and avoids probing for perl/ruby on every startup).
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("core.options")
require("core.keymaps")
require("core.lazy")
