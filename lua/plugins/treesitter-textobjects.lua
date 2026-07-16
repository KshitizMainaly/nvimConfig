return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "master",
  -- Loaded on demand as a dependency of nvim-treesitter (see treesitter.lua),
  -- so it must not load eagerly on its own.
  lazy = true,
  -- Configuration (keymaps for select/move/swap) lives in treesitter.lua under
  -- the `textobjects` table of nvim-treesitter.configs.setup(). This spec just
  -- ensures the correct branch is used alongside the master-branch core.
}
