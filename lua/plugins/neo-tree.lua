return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "left",
        width = 35,
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
      },
    })

    -- Workaround: neo-tree v3.x on Windows throws
    -- "attempt to get length of local 'parent' (a nil value)" at
    -- git/init.lua:642 because utils.split_path() returns nil for drive
    -- roots (e.g. "C:\"). Patch the internal helper to bail out safely.
    local ok_git, git = pcall(require, "neo-tree.git")
    if ok_git and git._find_existing_status_code_in_git_status then
      local utils = require("neo-tree.utils")
      git._find_existing_status_code_in_git_status = function(git_status, worktree_root, path)
        local status = git_status[path]
        if status then
          return status
        end
        local parent = path
        while not status do
          parent = utils.split_path(parent)
          if not parent or #parent < #worktree_root then
            break
          end
          status = git_status[parent]
        end
        if status == "!" or status == "?" then
          return status
        end
        return nil
      end
    end
  end,
}
